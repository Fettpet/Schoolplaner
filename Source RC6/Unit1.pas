unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Grids, math, Udatum, UAntrag,
  UVerschluesselung, U_Uebersichtsplan, U_Formular, UPfad;

type
  TForm1 = class(TForm)
    Auswahl: TPanel;
    RB_Urlaub: TRadioButton;
    RB_Fortbildung: TRadioButton;
    RB_Pruefung: TRadioButton;
    RB_Lehrplan: TRadioButton;
    RB_Stundenplanbau: TRadioButton;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Ansicht1: TMenuItem;
    Hilfe1: TMenuItem;
    Drucken1: TMenuItem;
    Speichern_click: TMenuItem;
    Einsatzplan: TMenuItem;
    Anleitung: TMenuItem;
    Button2: TButton;
    Beenden2: TMenuItem;
    Benutzer1: TMenuItem;
    Passwort: TMenuItem;
    RB_nichts: TRadioButton;
    Bearbeiten: TMenuItem;
    NeuesJahranlegen1: TMenuItem;
    CB_Jahreswahl: TComboBox;
    NeuenLehreranlegen1: TMenuItem;
    RB_einsatz: TRadioButton;
    Lehrerbersicht1: TMenuItem;
    Label2: TLabel;
    Ferien: TPanel;
    Label_Herbst: TLabel;
    Label_Winter: TLabel;
    Label_Weihnachten: TLabel;
    Label_Ostern: TLabel;
    Label_sommer: TLabel;
    Label1: TLabel;
    SG_hef_D1: TStringGrid;
    SG_hef_D2: TStringGrid;
    SG_hef_B1: TStringGrid;
    SG_hef_B2: TStringGrid;
    SG_WEf_D1: TStringGrid;
    SG_WEF_D2: TStringGrid;
    SG_WEF_B1: TStringGrid;
    SG_WEF_B2: TStringGrid;
    SG_WIF_D1: TStringGrid;
    SG_WIF_B1: TStringGrid;
    SG_WIF_D2: TStringGrid;
    SG_WIF_B2: TStringGrid;
    SG_OSF_D1: TStringGrid;
    SG_OSF_D2: TStringGrid;
    SG_OSF_B1: TStringGrid;
    SG_OSF_B2: TStringGrid;
    SG_SOF_D1: TStringGrid;
    SG_SOF_D2: TStringGrid;
    SG_SOF_D3: TStringGrid;
    SG_SOF_D4: TStringGrid;
    SG_SOF_D5: TStringGrid;
    SG_SOF_D6: TStringGrid;
    SG_SOF_B1: TStringGrid;
    SG_SOF_B2: TStringGrid;
    SG_SOF_B3: TStringGrid;
    SG_SOF_B4: TStringGrid;
    SG_SOF_B5: TStringGrid;
    SG_SOF_B6: TStringGrid;
    SG_ZUF_D: TStringGrid;
    SG_ZUF_B: TStringGrid;
    SG_WEF_D3: TStringGrid;
    SG_WEF_B3: TStringGrid;
    Lehrer_delete: TMenuItem;
    Jahr_delete: TMenuItem;
    Urlaubstagendern1: TMenuItem;
    LA_freitage: TLabel;
    Abgabedatumndern1: TMenuItem;
    FehlendeAntrge1: TMenuItem;
    Label_name: TLabel;
    Label_vorname: TLabel;
    Label_geb: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RG_bearbeiten: TRadioGroup;
    procedure FormCreate(Sender: TObject);

// Lehrerwahl
    procedure CB_Lehrer_aktu();
// aus einer Datei in die Unit schreiben
   procedure SG_schreiben( SG_aktu: pointer; eingabe: string);
   procedure SG_Laden( Dateiname: String);

// Auslesen aus einem Stringgrid
    function SG_auslesen( SG_aktu: TStringgrid): string;

// Die Maus dr�cken halten
    procedure SG_hef_B1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

// Die maus loslassen
    procedure SG_hef_B1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure CB_adminClick(Sender: TObject);
    procedure NeuesJahranlegen1Click(Sender: TObject);

// Die ganzen Proceduren f�r die Mausbewegung
    procedure SG_hef_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_hef_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_WEF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_WEF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_OSF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_OSF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_SOF_B6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_WIF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SG_WIF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure NeuenLehreranlegen1Click(Sender: TObject);
    procedure speichern();
// AUswerten, wie viele Tage noch frei sind
    procedure Urlaubstage_test(geb: TDatum);
    function anzahl_str(such_string, sub_string: string):integer;



// Die Setter Funktionen
    procedure set_Name( na: string);
    procedure set_vorname( vna: string);
    procedure set_geb( geb: TDatum);
    procedure set_kuerzel( ku: string);
    procedure set_amtsbez( amt: string);
    procedure set_admin( ad: boolean);

// Get funktionen
    function get_jahr(): integer;
    function get_kuerzel(): string;
// Einlesen der Datumsangaben
    procedure Datum_einlesen( Dateiname: String);
    procedure SG_ZUF_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CB_JahreswahlChange(Sender: TObject);
    procedure PasswortClick(Sender: TObject);
    procedure SG_WEF_B3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Beenden2Click(Sender: TObject);
    procedure Lehrerbersicht1Click(Sender: TObject);
    procedure Lehrer_deleteClick(Sender: TObject);
    procedure Jahr_deleteClick(Sender: TObject);
    procedure Urlaubstagendern1Click(Sender: TObject);
    procedure UrlaubClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure B_ableClick(Sender: TObject);
    procedure Abgabedatumndern1Click(Sender: TObject);
    procedure FehlendeAntrge1Click(Sender: TObject);
    procedure Speichern_clickClick(Sender: TObject);
    procedure EinsatzplanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Drucken1Click(Sender: TObject);
    procedure RG_bearbeitenClick(Sender: TObject);
  private
    Name: String;
    vorname: String;

    kuerzel: String;
    amtsbezeichnung: String;
    admin: Boolean;
    beschreibbar: Boolean;
    akt_jahr: integer;
    A_kuerzel: TStrings;
    A_Jahr: array of integer;
  public
    geburtstag, geb_aktu: TDatum;
  end;

var
  Form1: TForm1;
  Maus_h1: boolean;

implementation

uses UJahr, UNeuer_Lehrer, Uanmeldung, UPW_aendern, U_Lehrer_Ubersicht,
  ULehrer_bearbeiten, U_Jahr_Loeschen, U_Urlaub_anpassen, U_abgabedatum,
  U_fehlendeAntraege;

{$R *.dfm}
// Lehrer CB aktualliesieren
procedure TForm1.CB_Lehrer_aktu();
var
  f : TSearchRec;
  s, i : Integer;
  buffer: string;
  Ausgabe: string;
begin

end;


function TForm1.anzahl_str(such_string, sub_string: string): Integer;
var
  i, j: integer;
  gefunden: boolean;
begin
  result := 0;

  for i:=1 to length(such_string) - length(sub_string) +1 do
  begin
    gefunden := true;
    for j:=1 to length(sub_string) do
    begin
      if( such_string[i] <> sub_string[j]) then
      begin
        gefunden := false;
        break;
      end;
    end;
    if( gefunden = true) then
      result := result + 1;
  end;
end;

procedure TForm1.Urlaubstage_test(geb: TDatum);
var
  Freie_tage: integer;
begin
  if( geb.Jahr = 0 )  then
    Freie_Tage :=  Form9.get_freitage(geburtstag, akt_jahr)
  else
    Freie_Tage := Form9.get_freitage(geb, akt_jahr);

  if( Freie_tage = 0) then
    showmessage('Fehler: Die Freien Tage zu ihrem Alter konnten nicht gefunden werden');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_WIF_b1), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_WIF_b2), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_OSF_b1), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_OSF_b2), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b1), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b2), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b3), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b4), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b5), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_SOF_b6), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_HEF_b1), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_HEF_b2), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_WEF_b1), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_WEF_b2), 'U');
  Freie_Tage := Freie_Tage -anzahl_str(SG_auslesen( SG_ZuF_b), 'U');
  if( Freie_Tage > 0) then
    LA_freitage.Font.Color := 0;
  if( Freie_Tage = 0) then
    La_freitage.Font.Color := 65280;
  if( Freie_Tage < 0) then
    La_freitage.Font.Color := 255;
  La_freitage.Caption := 'Freie Tage: ' +inttostr(Freie_Tage);
end;

function TForm1.get_kuerzel(): string;
begin
  result := kuerzel;
end;

function TForm1.get_jahr(): integer;
begin
  result := strtoint(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  heute : TDateTime;
  Year, Month, Day : Word;
  f : TSearchRec;
  s : Integer;
  buffer: string;
  data: textfile;
begin
  CB_Jahreswahl.Clear();
// Das aktuelle Jahr rausfinden
  Heute:=Now;
  DecodeDate(Heute,Year,Month,Day);
  CB_Lehrer_aktu();
// Alle Jahre einlesen
  s := FindFirst(Ordner_data + '\Schuljahre\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      if( Pos('.jah', buffer) > 0) then
        CB_Jahreswahl.Items.Add(Copy(buffer, 1, length(buffer)-4));

      if(Copy(buffer, 1, length(buffer)-4) = inttostr(year + 1) ) and (Month > 8) then
        CB_Jahreswahl.ItemIndex := CB_Jahreswahl.Items.Count-1;
      if(Copy(buffer, 1, length(buffer)-4) = inttostr(year) ) and (CB_Jahreswahl.ItemIndex =0) then
        CB_Jahreswahl.ItemIndex := CB_Jahreswahl.Items.Count-1;
      s := FindNext(f);
    end;
    if( CB_Jahreswahl.ItemIndex = -1) then
      CB_Jahreswahl.ItemIndex := 0;

  finally
    FindClose(f);
  end;
  akt_jahr:= strtoint(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);
  Datum_einlesen(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);

  assignfile( data, Ordner_data + '\Schuljahre\' + CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex] + '.sch');
  reset(data);
  readln(data, buffer);
  closefile(data);
  if( buffer[1] = 't') then
  begin
   beschreibbar  := true;
   RG_bearbeiten.ItemIndex := 0;
  end
  else  begin
   beschreibbar := false;
   RG_bearbeiten.ItemIndex := 1;
  end;

end;

procedure TForm1.SG_Laden( Dateiname: String);
var
  Datei: Textfile;
  buffer: string;
begin
  if( FIleexists(Ordner_data + '\Urlaub\' + Dateiname) = true) then
  begin
    assignFile (Datei, Ordner_data + '\Urlaub\' + Dateiname);
    reset( datei);
// winterferien
    readln(Datei, buffer);
    SG_schreiben(SG_WIF_B1, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_WIF_B2, buffer);
// Osterferien
    readln(Datei, buffer);
    SG_schreiben(SG_OSF_B1, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_OSF_B2, buffer);
// Sommerferien
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B1, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B2, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B3, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B4, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B5, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_SOF_B6, buffer);
//Herbstferien
    readln(Datei, buffer);
    SG_schreiben(SG_HEF_B1, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_HEF_B2, buffer);
//Weihnachtsferien
    readln(Datei, buffer);
    SG_schreiben(SG_WEF_B1, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_WEF_B2, buffer);
    readln(Datei, buffer);
    SG_schreiben(SG_WEF_B3, buffer);
//ZUsatz
    readln(Datei, buffer);
    SG_schreiben(SG_ZUF_B, buffer);
    closefile(Datei);
  end else
  begin
// winterferien
    SG_schreiben(SG_WIF_B1, '     ');
    SG_schreiben(SG_WIF_B2, '     ');
// Osterferien
    SG_schreiben(SG_OSF_B1, '     ');
    SG_schreiben(SG_OSF_B2, '     ');
// Sommerferien
    SG_schreiben(SG_SOF_B1, '     ');
    SG_schreiben(SG_SOF_B2, '     ');
    SG_schreiben(SG_SOF_B3, '     ');
    SG_schreiben(SG_SOF_B4, '     ');
    SG_schreiben(SG_SOF_B5, '     ');
    SG_schreiben(SG_SOF_B6, '     ');
//Herbstferien
    SG_schreiben(SG_HEF_B1, '     ');
    SG_schreiben(SG_HEF_B2, '     ');
//Weihnachtsferien
    SG_schreiben(SG_WEF_B1, '     ');
    SG_schreiben(SG_WEF_B2, '     ');
//ZUsatz
    SG_schreiben(SG_ZUF_B, '           ');
  end;
end;


// einen String in die SG schreiben
procedure TForm1.SG_schreiben( SG_aktu: pointer; eingabe: string);
var
i: integer;
SG: ^TStringgrid;
begin
  SG := @SG_aktu;
  for i:=1 to sg.RowCount do
  begin
    if( eingabe[i] = '#') then
      sg.Cells[0,i-1] := ' '
    else
      sg.Cells[0,i-1] := eingabe[i];
  end;
end;

// Auslesen aus einem Stringgrid
function TForm1.SG_auslesen( SG_aktu: TStringGrid): string;
var
  buffer: string;
  i: Integer;
begin
  for i:= 0 to SG_aktu.RowCount-1 do
  begin
    if( SG_Aktu.Cells[0,i] = '') then
      buffer := buffer + ' '
    else
      buffer := buffer + SG_aktu.Cells[0,i];
  end;
  result := buffer;
end;

// Die Admin Clickbox
procedure TForm1.CB_adminClick(Sender: TObject);
begin

end;

{
Die Maus wird gedr�ckt
  Die Variable, in der Gespeichert ob die Maustaste gedr�ckt wird springt
  wieder auf true
}

procedure TForm1.SG_hef_B1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  maus_h1 := true;
end;
{
Die Maus wird Losgelassen
  Die Variable, in der Gespeichert ob die Maustaste gedr�ckt wird springt
  wieder auf false
}

procedure TForm1.SG_hef_B1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    maus_h1 := false;
end;


procedure TForm1.NeuesJahranlegen1Click(Sender: TObject);
begin
  Form2.Show;
end;


{
Solange die Maus bewegt wird, werden �berall die in den Radiobutton angegeben Dinger
eingeschrieben
Dies geschieht nur falls:
-in SG_XXF_DX etwas steht
-Bearbeitbar true ist
}

// Herbstferien erste Woche
procedure TForm1.SG_hef_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_hef_B1.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_hef_D1.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_hef_B1.Cells[0, Feld] := 'E';
     end;
     Urlaubstage_test(geb_Aktu);
  end;
end;

// Herbstferien zweite Woche
procedure TForm1.SG_hef_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_HEF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_hef_D2.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_HEF_B2.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_hef_B2.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

// Weihnachtsferien erste Woche
procedure TForm1.SG_WEF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_weF_B1.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_WEf_D1.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_weF_B1.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_WEf_B1.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//weihnachtsferien zweite Woche
procedure TForm1.SG_WEF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_weF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5)and (SG_WEf_D2.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_weF_B2.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_WEf_B2.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Osterferien erste Woche
procedure TForm1.SG_OSF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_osF_B1.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_OSf_D1.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_osF_B1.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_OSf_B1.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

// Osterferien zweite Woche
procedure TForm1.SG_OSF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_osF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_OSf_D2.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_osF_B2.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_OSf_B2.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien erste Woche
procedure TForm1.SG_SOF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B1.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_SOf_D1.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B1.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B1.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien zweite Woche
procedure TForm1.SG_SOF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_SOf_D2.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B2.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B2.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien dritte Woche
procedure TForm1.SG_SOF_B3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B3.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5)and (SG_SOf_D3.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B3.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B3.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien vierte Woche
procedure TForm1.SG_SOF_B4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B4.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5)and (SG_SOf_D4.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B4.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B4.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien f�nfte Woche
procedure TForm1.SG_SOF_B5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B5.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_SOf_D5.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B5.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B5.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Sommerferien sechste Woche
procedure TForm1.SG_SOF_B6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_soF_B6.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_SOf_D6.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_soF_B6.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_sof_B6.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

//Winterferien erste WOche
procedure TForm1.SG_WIF_B1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_wiF_B1.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5)and (SG_WIf_D1.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_wiF_B1.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_wif_B1.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

// Winterferien zweite Woche
procedure TForm1.SG_WIF_B2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_wiF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5)and (SG_WIf_D2.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_wiF_B2.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_wif_B2.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;

// Der Zusatzteil
procedure TForm1.SG_ZUF_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_wiF_B2.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 11)and (SG_ZUf_D.Cells[1,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_ZUF_B.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_zuf_B.Cells[0, Feld] := 'E';
     end;
  end;
  Urlaubstage_test(geb_Aktu);
end;


// Neuen Lehrer anlegen
// Die Verbindung zu der Unit
procedure TForm1.NeuenLehreranlegen1Click(Sender: TObject);
begin
  UNeuer_Lehrer.Form3.Show;
end;



// Einlesen der Datumsangaben
procedure TForm1.Datum_einlesen( Dateiname: String);
var
 i, anz, anz_sg: integer;
 Datei: TextFile;
 buffer: string;
begin
  anz := 0;
  anz_sg := 0;

// dritte Weihnachtsferien Woche Unsichtbar machen
        SG_WEF_D3.Visible := false;
        SG_WEF_B3.Visible := false;
// Datum reinschreiben
// erste Winterferien Woche
  if( Fileexists(Ordner_data + '\Schuljahre\' + Dateiname + '.jah') = false) then
    exit;
// �berschreiben
  SG_schreiben(SG_osF_D1,'     ');
  SG_schreiben(SG_osF_D2,'     ');
  SG_schreiben(SG_wiF_D1,'     ');
  SG_schreiben(SG_wiF_D2,'     ');
  SG_schreiben(SG_SoF_D1,'     ');
  SG_schreiben(SG_soF_D2,'     ');
  SG_schreiben(SG_soF_D3,'     ');
  SG_schreiben(SG_soF_D4,'     ');
  SG_schreiben(SG_soF_D5,'     ');
  SG_schreiben(SG_soF_D6,'     ');
  SG_schreiben(SG_heF_D1,'     ');
  SG_schreiben(SG_heF_D2,'     ');
  SG_schreiben(SG_WEF_D1,'     ');
  SG_schreiben(SG_WEF_D2,'     ');
  SG_schreiben(SG_WEF_D3,'     ');
  assignFile (Datei, Ordner_data + '\Schuljahre\' + Dateiname + '.jah');
  reset( datei);
  repeat
  // schauen was es ist
    readln(datei, buffer);
// Falls Winterferien
    if(buffer = 'Winterferien') then
    begin
// erste Woche Winterferien
      for i:= 1 to 5 do
      begin
        readln(Datei, buffer);
        if( is_datum(buffer) = true) then
        begin
          SG_WIF_D1.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
          if(wochentag(strtodate2(buffer)) = 6) then
            break;
        end else
          break;
      end;
// zweite Woche Winterferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_WIF_D2.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              buffer := '';
              break;
            end else
              buffer := '';
          end else
            break;
        end;
      end;
    end;
// Falls Osterferien
    if(buffer = 'Osterferien') then
    begin
// erste Woche Osterferien
      for i:= 1 to 5 do
      begin
        readln(Datei, buffer);
        if( is_datum(buffer) = true) then
        begin
          SG_OSF_D1.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
          if(wochentag(strtodate2(buffer)) = 6) then
          break;
        end else
          break;
      end;
// zweite Woche Osterferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_OSF_D2.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              buffer := '';
              break;
            end else
              buffer := '';
          end else
            break;
        end;
      end;
    end;
// Falls Sommerferien
    if(buffer = 'Sommerferien') then
    begin
// erste Woche Sommerferien
      for i:= 1 to 5 do
      begin
        readln(Datei, buffer);
        if( is_datum(buffer) = true) then
        begin
          SG_SOF_D1.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
          if(wochentag(strtodate2(buffer)) = 6) then
          break;
        end else
          break;
      end;
// zweite Woche Sommerferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_SOF_D2.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            break;
          end else
            break;
        end;
      end;
// dritte Woche Sommerferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_SOF_D3.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            break;
          end else
            break;
        end;
      end;
// vierte Woche Sommerferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_SOF_D4.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            break;
          end else
            break;
        end;
      end;
// f�nfte Woche Sommerferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_SOF_D5.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            break;
          end else
            break;
        end;
      end;
// sechste Woche Sommerferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_SOF_D6.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              buffer := '';
              break;
            end else
              buffer := '';
          end else
            break;
        end;
      end;
    end;

// Falls Herbstferien
    if(buffer = 'Herbstferien') then
    begin
// erste Woche Herbstferien
      for i:= 1 to 5 do
      begin
        readln(Datei, buffer);
        if( is_datum(buffer) = true) then
        begin
          SG_HEF_D1.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
          if(wochentag(strtodate2(buffer)) = 6) then
          break;
        end else
          break;
      end;
// zweite Woche Herbstferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_HEF_D2.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              buffer := '';
              break;
            end else
              buffer := '';
          end else
            break;
        end;
      end;
    end;
// Falls Weihnachtsferien
    if(buffer = 'Weihnachtsferien') then
    begin
// erste Woche Weihnachtsferien
      for i:= 1 to 5 do
      begin
        readln(Datei, buffer);
        if( is_datum(buffer) = true) then
        begin
          SG_WEF_D1.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
          if(wochentag(strtodate2(buffer)) = 6) then
          break;
        end else
          break;
      end;
// zweite Woche Weihnachtsferien
      if( is_datum(buffer) = true) then
      begin
        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_WEF_D2.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              break;
            end
          end else
            break;
        end;
      end;
//dritte Weihnachtsferien Woche

    if( is_datum(buffer) = true) then
    begin
      //sichtbar machen
        SG_WEF_D3.Visible := true;
        SG_WEF_B3.Visible := true;

        for i:= 0 to 4 do
        begin
          readln(Datei, buffer);
          if( is_datum(buffer) = true) then
          begin
            SG_WEF_D3.Cells[0,wochentag(strtodate2(buffer))-2] := buffer;
            if(wochentag(strtodate2(buffer)) = 6) then
            begin
              buffer := '';
              break;
            end else
              buffer := '';
          end else
            break;
        end;
    end;
    end;
// Falls ZUsatz
    if(buffer = 'Zusatz') then
    begin
// anzahl der Einztr�ge ermitteln
      readln( Datei, buffer);
      anz := strtoint(buffer);

// erste Woche Weihnachtsferien
      for i:= anz_sg to anz_sg + anz-1 do
      begin
        readln(Datei, buffer);
        SG_ZUF_D.Cells[0,i] := buffer;

        readln(Datei, buffer);
        SG_ZUF_D.Cells[1,i] := buffer;

      end;
      anz_sg := anz_sg + anz;
    end;
  until EOF(datei) = true;
  closefile(datei);
end;

// Die Setter funktionen
procedure TForm1.set_admin( ad: boolean);
begin
  admin := ad;
  if( admin = false) then
  begin
    bearbeiten.Visible := false;
    ansicht1.Visible := false;
    RG_bearbeiten.Visible := false;
  end;
end;
procedure TForm1.set_amtsbez( amt: string);
begin
  amtsbezeichnung := amt;
end;
procedure TForm1.set_geb( geb: TDatum);
begin
  geburtstag := geb;
end;
procedure TForm1.set_kuerzel( ku: string);
begin
  kuerzel := ku;
end;
procedure TForm1.set_vorname( vna: string);
begin
  vorname := vna;
end;
procedure TForm1.set_Name( na: string);
begin
 name := na;
end;



procedure TForm1.CB_JahreswahlChange(Sender: TObject);
var
  i:integer;
begin
   speichern();
   akt_jahr := strtoint(CB_Jahreswahl.Items[ CB_Jahreswahl.ItemIndex]);
// ZUsatz l�schen
  for i:=0 to 11 do
  begin
    SG_ZUF_d.Cells[0,i] := ' ';
    SG_ZUF_d.Cells[1,i] := ' ';
  end;
     // Weihnachts l�schen
  for i:=0 to 4 do
  begin
    SG_WEF_d1.Cells[0,i] := ' ';
    SG_WEF_d2.Cells[0,i] := ' ';
  end;
// Ostern l�schen
  for i:=0 to 4 do
  begin
    SG_OSF_d1.Cells[0,i] := ' ';
    SG_OSF_d2.Cells[0,i] := ' ';
  end;
  SG_Laden(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex] + '\' +kuerzel + '.urlaub');
  Datum_einlesen(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);
  Urlaubstage_test(geburtstag);
end;

procedure TForm1.PasswortClick(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm1.SG_WEF_B3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Feld: Integer;
begin
  if( Maus_h1 = true) then
  begin
     Feld := floor(y / SG_WEF_B3.DefaultRowHeight);
     if(Feld >= 0) and (Feld < 5) and (SG_WEF_D3.Cells[0,feld] <> '') and (Beschreibbar = true) then
     begin
      if(RB_Fortbildung.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'F'
      else if(RB_Lehrplan.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'L'
      else if(RB_Pruefung.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'P'
      else if(RB_Stundenplanbau.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'S'
      else if(RB_Urlaub.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'U'
      else if (RB_nichts.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := ' '
      else if (RB_Einsatz.Checked = true) then
        SG_WEF_B3.Cells[0, Feld] := 'E';
     end;
  end;               
end;

procedure TForm1.Beenden2Click(Sender: TObject);
begin
 close();
end;

procedure TForm1.Lehrerbersicht1Click(Sender: TObject);
begin
  U_Lehrer_Ubersicht.Form6.Show;
end;

procedure TForm1.Lehrer_deleteClick(Sender: TObject);
begin
  Form7.Label5.Visible := true;
  Form7.CB_Lehrer.Visible := true;
  Form7.Show;
end;

procedure TForm1.Jahr_deleteClick(Sender: TObject);
begin
  Form8.Show;
end;

procedure TForm1.Urlaubstagendern1Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm1.UrlaubClick(Sender: TObject);
var
  Antrag: TAntrag;
begin
    Antrag := TAntrag.create(name, vorname, kuerzel, amtsbezeichnung, Ordner_data + '\Urlaub\' + inttostr(akt_jahr) + '\' + kuerzel + '.urlaub');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  freie_tage, i: Integer;
  buffer: string;
  heute : TDateTime;
  Year, Month, Day : Word;
  datei: textfile;
  abgabe: TStringlist;
  Antrag: TFormular;
  vorhanden: Boolean;
begin
  vorhanden := false;
  Heute:=Now;
  DecodeDate(Heute,Year,Month,Day);
  speichern();
// Das aktuelle Jahr rausfinden
  Heute:=Now;
  DecodeDate(Heute,Year,Month,Day);
  buffer := LA_freitage.Caption;
  freie_tage := strtoint(copy(buffer, 12, length(buffer)));
  if( freie_tage < 0) then
  begin
    if application.MessageBox('Sie haben zu viele Freie Tage'#13#10'Antrag trotzdem einreichen?','Antrag einreichen?', MB_YESNO) = IDNO then
    begin
      exit;
    end;
  end;
  abgabe := TStringlist.Create;
  if(fileexists(Ordner_data + '\Abgabe\'+inttostr(akt_jahr)+'.abg')) then
  begin
    abgabe.LoadFromFile(Ordner_data + '\Abgabe\'+inttostr(akt_jahr)+'.abg');
    for i:=0 to abgabe.Count-1 do
    begin
      if( abgabe[i] = kuerzel) then vorhanden := true;
    end;
  end else begin
    //Assignfile(data,
  end;
  if(vorhanden = false) then
  begin
   abgabe.Add(kuerzel);
    abgabe.SaveToFile(Ordner_data + '\Abgabe\'+inttostr(akt_jahr)+'.abg');
  end;
// Freie Tage ermitteln
  Freie_tage := 0;
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_WIF_b1), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_WIF_b2), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_OSF_b1), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_OSF_b2), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b1), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b2), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b3), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b4), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b5), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_SOF_b6), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_HEF_b1), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_HEF_b2), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_WEF_b1), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_WEF_b2), 'U');
  Freie_Tage := Freie_Tage +anzahl_str(SG_auslesen( SG_ZuF_b), 'U');

  Antrag := TFormular.Create(kuerzel,CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);
    Antrag.set_erholung(0);
    Antrag.set_zusatz(0);

    Antrag.set_gesamt(Form9.get_freitage(geburtstag, akt_jahr));

    Antrag.set_beantragt(Freie_Tage);
    Antrag.set_abgabe(inttostr(day) + '.' + inttostr(month) + '.' + inttostr(year));
  //  Antrag.set_einreichung('Heute?');
  Antrag.speichern;
  Antrag.Free; 
end;

procedure TForm1.B_ableClick(Sender: TObject);
var
  Rueckgabe: string;
begin
  Rueckgabe := InputBox('Ablehnung', 'Begr�ndung:', '');
  ShowMessage(Rueckgabe);
end;

procedure TForm1.Abgabedatumndern1Click(Sender: TObject);
begin
  form10.Show;
end;

procedure TForm1.FehlendeAntrge1Click(Sender: TObject);
begin
  Form11.Show;
end;

procedure TForm1.Speichern_clickClick(Sender: TObject);
begin
  speichern();
end;
// das Speichern das Antrages erm�glichen
procedure TFORM1.speichern();
var
  Datei: Textfile;
  buffer, buffer2: string;
  i,j: integer;
begin
  AssignFile(Datei, Ordner_data + '\Urlaub\' + inttostr(akt_jahr) + '\' + kuerzel + '.urlaub');
  Rewrite(Datei);
  // Zeile f�r Zeile in die Datei schreiben
// Winterferien
  buffer := SG_auslesen( SG_WIF_B1);
  for i:=0 to 4 do
  begin
    if(length(SG_WIF_D1.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_WIF_B2);
  for i:=0 to 4 do
  begin
    if(length(SG_WIF_D2.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);
// Osterferien
  buffer := SG_auslesen( SG_OSF_B1);

  for i:=0 to 4 do
  begin
    if(length(SG_OSF_D1.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_OSF_B2);
  for i:=0 to 4 do
  begin
    if(length(SG_OSF_D2.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

// Sommerferine
  buffer := SG_auslesen( SG_SOF_B1);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D1.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);
// Hier gehts weiter
  buffer := SG_auslesen( SG_SOF_B2);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D2.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_SOF_B3);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D3.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_SOF_B4);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D4.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_SOF_B5);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D5.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_SOF_B6);
  for i:=0 to 4 do
  begin
    if(length(SG_SOF_D6.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

// Herbstferien
  buffer := SG_auslesen( SG_HEF_B1);
  for i:=0 to 4 do
  begin
    if(length(SG_HEF_D1.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_HEF_B2);
  for i:=0 to 4 do
  begin
    if(length(SG_HEF_D2.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);



// Weihnachtsferien
  buffer := SG_auslesen( SG_WEF_B1);
  for i:=0 to 4 do
  begin
    if(length(SG_WEF_D1.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_WEF_B2);
  for i:=0 to 4 do
  begin
    if(length(SG_WEF_D2.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

  buffer := SG_auslesen( SG_WEF_B3);
  for i:=0 to 4 do
  begin
    if(length(SG_WEF_D3.Cells[0,i]) < 4) then
    begin
      buffer2 := '';
      for j:=0 to i-1 do
        buffer2 := buffer2 + buffer[j+1];
      buffer2 := buffer2 + '#';
      for j:=i+1 to 4 do
        buffer2 := buffer2 + buffer[j+1];
      buffer := buffer2;
    end;
  end;
  writeln(Datei, buffer);

// Zusatz
  writeln(Datei, SG_auslesen( SG_ZUF_B));

  closefile(Datei);
end;
procedure TForm1.EinsatzplanClick(Sender: TObject);
var
  ausgabe: TUebersicht;
begin
  ausgabe := TUebersicht.Create();
  ausgabe.Ausfuehren(CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]);
  ausgabe.Free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (kuerzel <> '') then
    speichern();
end;

procedure TForm1.Drucken1Click(Sender: TObject);
begin
  speichern();
  Button2Click(Sender);
end;

procedure TForm1.RG_bearbeitenClick(Sender: TObject);
var
  data:textfile;
begin
  Assignfile(data, Ordner_data +'\Schuljahre\' + inttostr(akt_jahr) + '.sch');
  rewrite(data);
  if( RG_bearbeiten.ItemIndex = 0) then
  begin
    writeln(data, 't');
    Beschreibbar := true;
  end
  else
  begin
    writeln(data, 'f');
     Beschreibbar := false;
  end;
  closefile(data);
end;

end.
