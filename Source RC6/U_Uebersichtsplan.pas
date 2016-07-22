unit U_Uebersichtsplan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, UPfad;

type
  TUebersicht = class
  private
    exel, workbook, worksheet: Variant;
    datum : TDateTime;
    temp, ferienname, temp_file, temp_lehrer: String;
    dateiliste, lehrer: widestring;
    ColumnRange: OleVariant;
    Ferien, Urlaub, Lehrerfile: TextFile;
    wtage: Array[1..7] of String;
    h, tage, head_pos,wochentag, w_zaehler, wochenpos, file_anzahl: integer;
  public
    procedure Ausfuehren(Jahr: string);
    procedure find_files(pfad, typ, result: String);
    procedure create_filename;
    procedure create_lehrer;
    procedure daten_eintragen(Jahr: string);
    procedure abschluss;
    procedure zusatz;
    procedure ferienschleife(name: string);
end;

  //--- Diverse wichtige Konstanten, welche die Standartwerte definieren -------
  Const xlVAlignCenter = -4108;
  Const xlVAlignTop = -4160;
  Const xlHAlignCenter = -4108;
  Const xlThin = 2;
  Const xlEdgeBottom = 9;
  Const xlDouble = -4119;
  Const xlThick = 4;
  Const xl3DColumn = -4100;
  Const xlColumns = 2;
  Const xlLocationAsObject = 2;
  Const xlLeft = -4131;
  Const xlRight = -4152;
  Const xlTop = -4160;
  const xlCellTypeLastCell = $0000000B;
  Const xlLandscape = 2;
  Const xlPaperA4 = 9;

implementation

function verschluesselung(s: string): string;
var
i:integer;
begin
  for i:=1 to length(s) do begin
    s[i]:=Chr(Ord(s[i]) + i);
  end;
  result := s;
end;

function entschluesselung(s: string): string;
var
i:integer;
begin
  for i:=1 to length(s) do begin
    s[i]:=Chr(Ord(s[i]) - i);
  end;
  result := s;
end;

procedure TUebersicht.find_files(pfad, typ, result: String);
var datei_info: tSearchRec;
begin
  //--- Im gewählten Verzeichnis nach der Datei suchen -------------------------
  file_anzahl := 0;
  if FindFirst(pfad + typ, faAnyFile, datei_info) = 0 then
  begin
    repeat
      if (datei_info.Name <> '.') and (datei_info.Name <> '..') and (datei_info.Name <> '.urlaub') then
      begin
        //--- Sammlung aller Dateipfade ----------------------------------------
        dateiliste := dateiliste + (pfad + datei_info.Name) + '#';
        //--- Samlung aller Lehrer ---------------------------------------------
        lehrer := lehrer + datei_info.Name + '#';
        //--- Gesamtzahl der Files (für Schleife) ------------------------------
        file_anzahl := file_anzahl + 1;
      end;
    until FindNext (datei_info) <> 0;
  end;
  FindClose (datei_info);
end;

procedure TUebersicht.create_filename;
begin
  temp_file := '';
  //--- Holt den jeweils ersten Dateipfad und löscht ihn aus der Sammlung ------
  if dateiliste <> '' then
  begin
    while dateiliste[1] <> '#' do
    begin
      temp_file := temp_file + dateiliste[1];
      Delete(dateiliste,1,1);
    end;
    Delete(dateiliste,1,1);
  end;
end;

procedure TUebersicht.create_lehrer;
begin
  temp_lehrer := '';
  //--- holt den jeweils ersten Lehrer und löscht ihn aus der Sammlung ---------
  if lehrer <> '' then
  begin
    while lehrer[1] <> '#' do
    begin
      temp_lehrer := temp_lehrer + lehrer[1];
      Delete(lehrer,1,1);
    end;
    Delete(lehrer,1,1);
  end;
  //--- Entfernt ".urlaub" vom String ------------------------------------------
  Delete(temp_lehrer,Length(temp_lehrer) - 6,7);
end;

procedure TUebersicht.daten_eintragen(Jahr: string);
var zeile, spalte, z, i, j, txt_zeile, auslassung, laufnummer: integer;
    zusatz_pos: Array [0..11] of Integer;
    zusatz_zelle, lehrername, umgehung: string;
begin
  dateiliste := '';
  lehrer := '';
  laufnummer := 0;
  ColumnRange.Columns[1].ColumnWidth := 2;
  find_files(Ordner_data + '\Urlaub\' + Jahr + '\', '*.URLAUB', dateiliste);
  zeile := 5;
  while file_anzahl <> 0 do
  begin
    file_anzahl := file_anzahl - 1;
    spalte := 5;
    z := 0;
    zeile := zeile + 1;
  txt_zeile := 0;
  create_filename;
  create_lehrer;
  AssignFile(Urlaub, temp_file);
  Reset(Urlaub);
  AssignFile(Lehrerfile, Ordner_data + '\Lehrer\' + temp_lehrer + '.leh');
  Reset(Lehrerfile);
  laufnummer := laufnummer + 1;
  worksheet.Cells[zeile,1] := laufnummer;                   // Laufnummer
  worksheet.Cells[zeile,2] := temp_lehrer;                  // Kürzel
  readln(Lehrerfile, lehrername);                           // Überspringen
  readln(Lehrerfile, lehrername);
  worksheet.Cells[zeile,3] := entschluesselung(lehrername); // Name
  readln(Lehrerfile, lehrername);
  worksheet.Cells[zeile,4] := entschluesselung(lehrername); // Vorname
  Reset(Urlaub);
  repeat
    //--- Prüfung auf gedrehte Schrift, was einen Zusatz bedeutet --------------
    if worksheet.Cells[1,spalte].WrapText = True then
      begin
        zusatz_pos[z] := spalte;                            // Position merken
        spalte := spalte + 2;                               // Überspringen
        z := z + 1;
      end
    else
      begin
        readln(Urlaub, temp);
        txt_zeile := txt_zeile + 1;
        if txt_zeile <> 16 then
        begin
          auslassung := 0;
          j := 1;
          //--- Leere Tage werden ausgelassen, da kein Datum dafür existiert ---
          if temp = '#####' then readln(Urlaub, temp);
          while temp[j] = '#' do
          begin
            auslassung := auslassung + 1;
            j := j + 1;
          end;
          for i := 1 to 5 do
          begin
            if (auslassung = 0) and (temp[i] <> '#') then
              begin
                umgehung := temp[i];
                worksheet.Cells[zeile,spalte] := umgehung;
                if temp[i] = 'F' then worksheet.Cells[zeile,spalte].Interior.colorindex := 44;
                if temp[i] = 'E' then worksheet.Cells[zeile,spalte].Interior.colorindex := 46;
                if temp[i] = 'P' then worksheet.Cells[zeile,spalte].Interior.colorindex := 43;
                spalte := spalte + 1;
              end
            else
              auslassung := auslassung - 1;
            end;
          end;
          spalte := spalte + 1;
      end;
  until eof(Urlaub) = true;
  if z <> 0 then
  begin
  repeat
    //--- Eintragen der Zusätze an den gespeicherten Positionen ----------------
    zusatz_zelle := temp[z];
    spalte := zusatz_pos[z - 1];
    worksheet.Cells[zeile,spalte] := zusatz_zelle;
    if temp[z] = 'F' then worksheet.Cells[zeile,spalte].Interior.colorindex := 44;
    if temp[z] = 'E' then worksheet.Cells[zeile,spalte].Interior.colorindex := 46;
    if temp[z] = 'P' then worksheet.Cells[zeile,spalte].Interior.colorindex := 43;
    z := z - 1;
  until z = 0;
  end;
  closefile(Urlaub);
  closefile(Lehrerfile);
  end;

end;

procedure TUebersicht.abschluss;
begin
  //--- Mitzählen der Ferienwochen ---------------------------------------------
  w_zaehler := w_zaehler + 1;
  worksheet.Cells[2,wochenpos].Font.Size := 9;
  worksheet.Cells[2,wochenpos].Font.Bold := True;
  if (ferienname = 'Weihnachten') or (tage <> 5) then
    worksheet.Cells[2,wochenpos] := inttostr(w_zaehler) + '.'
  else
    worksheet.Cells[2,wochenpos] := inttostr(w_zaehler) + '. Woche';
  //--- Sprung zum nächsten Wochenanfang ---------------------------------------
  case tage of
    1: wochenpos := wochenpos + 2;            // Trennspalte erfordert das
    2: wochenpos := wochenpos + 3;            // Weiterrücken um eine Einheit
    3: wochenpos := wochenpos + 4;            // mehr!
    4: wochenpos := wochenpos + 5;
    5: wochenpos := wochenpos + 6;
  end;
  //--- Trennspalte erstellen und überspringen, Zählvariable zurücksetzen --
  ColumnRange.Columns[h].ColumnWidth := 1;
  tage := 0;
  h := h + 1;
end;

procedure TUebersicht.zusatz;
var k, anzahl,wochentag: integer;
begin
  head_pos := h;
  readln(Ferien, temp);
  anzahl := strtoint(temp) - 1;
  for k := 0 to anzahl do
  begin
    readln(Ferien, temp);
    worksheet.Cells[1,head_pos] := temp;
    worksheet.Cells[1,head_pos].Font.Size := 8;
    worksheet.Cells[1,head_pos].Orientation := 90;
    worksheet.Cells[1,head_pos].WrapText := True;
    worksheet.Cells[1,head_pos].Font.Bold := True;
    worksheet.Cells[1,head_pos].HorizontalAlignment := xlHAlignCenter;
    worksheet.Cells[1,head_pos].VerticalAlignment := xlVAlignCenter;
    readln(Ferien, temp);
    tage := tage + 1;
    //--- Ermitteln des Wochentags und Eintragung ------------------------------
    datum := StrToDate(temp);
    wochentag := DayOfWeek(datum);
    worksheet.Cells[4,h] := wtage[wochentag];
    worksheet.Cells[4,h].Font.Size := 8;
    worksheet.Cells[4,h].Orientation := 90;
    worksheet.Cells[4,h].WrapText := True;
    worksheet.Cells[4,h].HorizontalAlignment := xlHAlignCenter;
    //--- Eintragen und Formatieren des Datums ---------------------------------
    if temp[2] = '.' then temp := '0' + temp;
    worksheet.Cells[3,h] := temp;
    worksheet.Cells[3,h].Orientation := 90;
    worksheet.Cells[3,h].WrapText := True;
    worksheet.Cells[3,h].HorizontalAlignment := xlHAlignCenter;
    worksheet.Cells[3,h].VerticalAlignment := xlVAlignCenter;
    worksheet.Cells[3,h].Font.Size := 8;
    ColumnRange.Columns[h].ColumnWidth := 1.3;
    //--- Nächste Spalte und Setzung der Trennspalte ---------------------------
    h := h + 1;
    ColumnRange.Columns[h].ColumnWidth := 1;
    h := h + 1;
    head_pos := h;
  end;
  readln(Ferien, temp);
end;

procedure TUebersicht.ferienschleife(name: string);
begin
  //--- Zeile zum Schleifenanfang IMMER ein Ferienname! ------------------------
  ferienname := temp;
  //--- Steuervariablen für Spaltenpositionen ----------------------------------
  tage := 0;
  head_pos := h;
  wochenpos := h;
  w_zaehler := 0;
  //--- Einlesen der nächsten Zeile in temp ------------------------------------
  readln(Ferien, temp);
  //--- Name der Ferien und Formatierung ---------------------------------------
      worksheet.Cells[1,head_pos] := ferienname;
      worksheet.Cells[1,head_pos].Font.Size := 10;
      worksheet.Cells[1,head_pos].Font.Bold := True;
      worksheet.Cells[1,head_pos].VerticalAlignment := xlVAlignCenter;
  //------------- Schleife ('Ferienname' = Stopper) ----------------------------
  while (temp <> name) and (temp <> 'Zusatz') and (eof(Ferien) = false) do
  begin
    tage := tage + 1;
    //--- Ermitteln des Wochentags und Eintragung ------------------------------
    datum := StrToDate(temp);                 // wandelt Datums-String in Datum
    wochentag := DayOfWeek(datum);            // ermittelt Wochentag aus Datum
    worksheet.Cells[4,h] := wtage[wochentag]; // trägt entsprechenden W-Tag ein
    worksheet.Cells[4,h].Font.Size := 8;      // Schriftgröße
    worksheet.Cells[4,h].Orientation := 90;   // dreht den Text um 90°
    worksheet.Cells[4,h].WrapText := True;    // dreht die Buchstaben
    worksheet.Cells[4,h].HorizontalAlignment := xlHAlignCenter;
    //--- Eintragen und Formatieren des Datums ---------------------------------
    if temp[2] = '.' then temp := '0' + temp; // Datumsformat: 0x.xx.xxxx
    worksheet.Cells[3,h] := temp;
    worksheet.Cells[3,h].Orientation := 90;
    worksheet.Cells[3,h].WrapText := True;
    worksheet.Cells[3,h].HorizontalAlignment := xlHAlignCenter;
    worksheet.Cells[3,h].VerticalAlignment := xlVAlignCenter;
    worksheet.Cells[3,h].Font.Size := 8;
    ColumnRange.Columns[h].ColumnWidth := 1.3;
    //--- Nächste Spalte und Setzung der Trennspalte ---------------------------
    h := h + 1;
    readln(Ferien, temp);
    //--- Nummer der Woche ermitteln und eintragen -----------------------------                     
    if (temp = name) or (temp = 'Zusatz') or (wtage[wochentag] = 'Fr') then abschluss;
  end;
  if temp = 'Zusatz' then zusatz;
  if eof(Ferien) = true then
  begin
    tage := tage + 1;
    //--- Ermitteln des Wochentags und Eintragung ------------------------------
    datum := StrToDate(temp);                 // wandelt Datums-String in Datum
    wochentag := DayOfWeek(datum);            // ermittelt Wochentag aus Datum
    worksheet.Cells[4,h] := wtage[wochentag]; // trägt entsprechenden W-Tag ein
    worksheet.Cells[4,h].Font.Size := 8;      // Schriftgröße
    worksheet.Cells[4,h].Orientation := 90;   // dreht den Text um 90°
    worksheet.Cells[4,h].WrapText := True;    // dreht die Buchstaben
    worksheet.Cells[4,h].HorizontalAlignment := xlHAlignCenter;
    //--- Eintragen und Formatieren des Datums ---------------------------------
    if temp[2] = '.' then temp := '0' + temp; // Datumsformat: 0x.xx.xxxx
    worksheet.Cells[3,h] := temp;
    worksheet.Cells[3,h].Orientation := 90;
    worksheet.Cells[3,h].WrapText := True;
    worksheet.Cells[3,h].HorizontalAlignment := xlHAlignCenter;
    worksheet.Cells[3,h].VerticalAlignment := xlVAlignCenter;
    worksheet.Cells[3,h].Font.Size := 8;
    ColumnRange.Columns[h].ColumnWidth := 1.3;
    //--- Nächste Spalte und Setzung der Trennspalte ---------------------------
    h := h + 1;
    abschluss;
  end;
end;

procedure TUebersicht.Ausfuehren(jahr: string);
var RangeAddress : String;
begin
  //--- Startet Excel, sofern es installiert ist! ------------------------------
  try
    exel := CreateOleObject('Excel.Application'); // erzeugt Instanz/Objekt
    exel.Visible := false; // macht das GUI von Excel unsichtbar
  except
    ShowMessage('Excel konnte nicht gestartet werden. Bitte stellen Sie sicher, dass es ordnungsgemäß installiert wurde.');
    Exit; // Schließung des Programms, wenn sich Excel nicht öffnen lässt
  end;
  //--- Erstellt "WorkBook" und "WorkSheet" ------------------------------------
  workbook := exel.Workbooks.Add;
  worksheet := workbook.ActiveSheet;
  ColumnRange := exel.Workbooks[1].WorkSheets[1].Columns;
  //--- Öffnet Datei mit Feriendaten -------------------------------------------
  AssignFile(Ferien,Ordner_data + '\Schuljahre\' + Jahr +'.jah');
  Reset(Ferien);
  readln(Ferien, temp);
  //--- Zeilenhöhen anpassen ---------------------------------------------------
  worksheet.Rows[1].RowHeight := 60;
  worksheet.Rows[3].RowHeight := 47;
  worksheet.Rows[4].RowHeight := 15;
  worksheet.Rows[5].RowHeight := 6;
  //--- Spaltenvariable und Array definieren -----------------------------------
  h := 5;                                     // erste Spaltenposition
  wtage[1] := 'So';                           // Array für Wochentage
  wtage[2] := 'Mo';
  wtage[3] := 'Di';
  wtage[4] := 'Mi';
  wtage[5] := 'Do';
  wtage[6] := 'Fr';
  wtage[7] := 'Sa';
  //--- Aufrufen der Prozedur "Ferienschleife" mit Parametern ------------------
  if temp = 'Zusatz' then zusatz;
  ferienschleife('Osterferien');                        // Winterferien
  ferienschleife('Sommerferien');
  ferienschleife('Herbstferien');
  ferienschleife('Weihnachtsferien');
  ferienschleife('');                                   // Leerstring
  //--- Abschluss --------------------------------------------------------------
  CloseFile(Ferien);                          // schließt das .jah-File wieder
  daten_eintragen(jahr);
    worksheet.PageSetup.PrintArea        := worksheet.Range[worksheet.Cells.Item[1, 1],worksheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam)].Address[1, 1,1, 1, 1];
    worksheet.PageSetup.Orientation      := xlLandscape;
    worksheet.PageSetup.Zoom             := false;
    worksheet.PageSetup.FitToPagesWide   := 1;
    worksheet.PageSetup.LeftMargin       := worksheet.Application.InchesToPoints(0.2);
    worksheet.PageSetup.RightMargin      := worksheet.Application.InchesToPoints(0.2);
    worksheet.PageSetup.BottomMargin     := worksheet.Application.InchesToPoints(0.2);
    worksheet.PageSetup.TopMargin        := worksheet.Application.InchesToPoints(0.6);
    worksheet.PageSetup.HeaderMargin     := 0;
    worksheet.PageSetup.FooterMargin     := 0;
    worksheet.PageSetup.PaperSize        := xlPaperA4;
    worksheet.PageSetup.FitToPagesTall := 1;
  exel.ActiveSheet.Name := 'Einsatzplan_' + jahr;
  workbook.SaveAs(Ordner_data + '\Excel-Files\Einsatzpläne\Einsatzplan_' + jahr + '.xls');
  exel.Visible := true;
end;

end.
