unit U_fehlendeAntraege;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, USortierung, UVerschluesselung, ExtCtrls, UPfad;

type
  TForm11 = class(TForm)
    SG_Uebersicht: TStringGrid;
    Label2: TLabel;
    CB_Jahreswahl: TComboBox;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure CB_JahreswahlChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.FormCreate(Sender: TObject);
var
  heute : TDateTime;
  Year, Month, Day : Word;
  f : TSearchRec;
  s : Integer;
  buffer: string;
begin
// beschriftung des Grids
  SG_Uebersicht.Cells[0, 0] := 'Nachname';
  SG_Uebersicht.Cells[1, 0] := 'Vorname';
  SG_Uebersicht.Cells[2, 0] := 'Amts.-Bez.';

  CB_Jahreswahl.Clear();
// Das aktuelle Jahr rausfinden
  Heute:=Now;
  DecodeDate(Heute,Year,Month,Day);
// Alle Jahre einlesen
  s := FindFirst(Ordner_data + '\Abgabe\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      if( Pos('.abg', buffer) > 0) then
        CB_Jahreswahl.Items.Add(Copy(buffer, 1, length(buffer)-4));

      if((Copy(buffer, 1, length(buffer)-4) = inttostr(year + 1)) and (month > 8)  ) then
        CB_Jahreswahl.ItemIndex := CB_Jahreswahl.Items.Count-1;

      s := FindNext(f);
    end;
    if( CB_Jahreswahl.ItemIndex = -1) then
      CB_Jahreswahl.ItemIndex := 0;

  finally
    FindClose(f);
  end;
  CB_JahreswahlChange(Sender);
end;

procedure TForm11.CB_JahreswahlChange(Sender: TObject);
var
  f : TSearchRec;
  s, i, nr : Integer;
  buffer: string;
  gefunden: boolean;
  datei: Textfile;
  Lehrer: TStringlist;
begin
  nr := 1;
  Lehrer := TStringlist.Create;

  lehrer.LoadFromFile(Ordner_data + '\Abgabe\'+CB_Jahreswahl.Items[ CB_Jahreswahl.itemindex]+'.abg');
  s := FindFirst(Ordner_data + '\Lehrer\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      gefunden := false;

// Einen Lehrer Einlesen
      if( Pos('.leh', buffer) > 0) then
      begin
        for i:=0  to lehrer.Count-1 do
        begin
        //  showmessage('Lehrer[i] ' + lehrer[i] + ' l:' + inttostr(length(lehrer[i])) + ' copy ' + copy(buffer, 1, length(buffer)-4) + ' l:' + inttostr(length(copy(buffer, 1, length(buffer)-4))));
          if( copy(buffer, 1, length(buffer)-4) = lehrer[i]) then
          begin
        //    showmessage('Gefunden ' + lehrer[i]);
            gefunden := true;
          end;
        end;

      if(gefunden = false) then
      begin

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
        // Amtsbez Auslesen
          buffer := '';
          readln(datei, buffer);

          SG_Uebersicht.Cells[2, nr] := entschluesselung(buffer);
          closefile(datei);
           nr := nr + 1;
        end;
      end;


      s := FindNext(f);
    end;
    SG_Uebersicht.RowCount := nr;
  finally
    FindClose(f);
  end;
  SG_Sort(SG_Uebersicht, 0,1);
end;

end.
