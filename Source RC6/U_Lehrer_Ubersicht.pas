unit U_Lehrer_Ubersicht;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, UVerschluesselung, math, ExtCtrls, USortierung, UPfad;

type
  TForm6 = class(TForm)
    SG_Uebersicht: TStringGrid;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SG_UebersichtMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure TimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    nr: Integer;
  end;

var
  Form6: TForm6;
  Feld_nr: Integer;
  Doppelklick: boolean;

implementation

uses ULehrer_bearbeiten;

{$R *.dfm}



procedure TForm6.FormCreate(Sender: TObject);
var
  f : TSearchRec;
  s, i  : Integer;
  buffer: string;
  datei: Textfile;

begin
  nr := 1;
// Die Markierung beschrifften
  SG_Uebersicht.Cells[0, 0] := 'Name';
  SG_Uebersicht.Cells[1, 0] := 'Vorname';
  SG_Uebersicht.Cells[2, 0] := 'Geburtstag';
  SG_Uebersicht.Cells[3, 0] := 'Amtsbez.';
  SG_Uebersicht.Cells[4, 0] := 'Admin';
  SG_Uebersicht.Cells[5, 0] := 'Kürzel';
// Alle Lehrer Einlesen
  s := FindFirst(Ordner_data + '\Lehrer\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;

// Einen Lehrer Einlesen
      if( Pos('.leh', buffer) > 0) then
      begin
        //Kuerzel übernehmen
          SG_Uebersicht.Cells[5, nr] := '';
          for i:=1 to length(buffer)-4 do
          begin
            SG_Uebersicht.Cells[5, nr] := SG_Uebersicht.Cells[5, nr] + buffer[i];
          end;

        Assignfile(datei, Ordner_data + '\Lehrer\' + buffer);
        reset(datei);
        //PW auslesen
          readln(datei, buffer);
        // Name Auslesen
          buffer := '';
          readln(datei, buffer);
          SG_Uebersicht.Cells[0, nr] := entschluesselung(buffer);
        // Vorname Auslesen
          buffer := '';
          readln(datei, buffer);
          SG_Uebersicht.Cells[1, nr] := entschluesselung(buffer);
        // geb Auslesen
          buffer := '';
          readln(datei, buffer);
          SG_Uebersicht.Cells[2, nr] := entschluesselung(buffer);
        // Amtsbez Auslesen
          buffer := '';
          readln(datei, buffer);

          SG_Uebersicht.Cells[3, nr] := entschluesselung(buffer);
        // Admin Auslesen
          buffer := '';
          readln(datei, buffer);

          if(entschluesselung(buffer) = 't') then
            SG_Uebersicht.Cells[4, nr] := '      x'
          else
            SG_Uebersicht.Cells[4, nr] := ' ';
          nr := nr + 1;



          closefile(datei);
      end;


      s := FindNext(f);
    end;
    SG_Uebersicht.RowCount := nr;
  finally
    FindClose(f);
  end;
  SG_Sort(SG_Uebersicht, 0,1);
end;

procedure TForm6.SG_UebersichtMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  Feld: Integer;
begin
  begin
     Feld := floor(y / SG_Uebersicht.DefaultRowHeight);
     if(Feld > 0) and (Feld < SG_Uebersicht.RowCount) then
     begin
      if( Doppelklick = true) and (feld = Feld_nr) then
      begin
        Form7.set_Kuerzel(SG_Uebersicht.Cells[5, Feld]);
        Form7.CB_Lehrer.Visible := false;
        Form7.Label5.Visible := false;
        Form7.Show;
      end else begin
        Feld_nr := Feld;
        Doppelklick := true;
        Timer.Enabled := true;
      end;
     end;
  end;
end;

procedure TForm6.TimerTimer(Sender: TObject);
begin
  Feld_nr := 0;
  Doppelklick := false;
  Timer.Enabled := false;
end;

procedure TForm6.FormResize(Sender: TObject);
begin
  SG_Uebersicht.Height := Form6.clientheight-20;


end;

end.



