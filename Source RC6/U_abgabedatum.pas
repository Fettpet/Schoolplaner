unit U_abgabedatum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDatum, UPfad;

type
  TForm10 = class(TForm)
    CB_Tag: TComboBox;
    CB_Monat: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    abgabedatum: TDatum;
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var
  datei: Textfile;
  auslese: TStringList;
  buffer: string;
  gefunden: boolean;
begin
  gefunden := false;
  auslese := TStringList.Create();
  Assignfile(datei, Ordner_data + '\Einstellungen.inf');
  reset(datei);
  repeat
    readln(datei, buffer);

    if( pos('Abgabedatum', buffer) > 0) then
    begin
      gefunden := true;
      auslese.Add('Abgabedatum='+inttostr(CB_Tag.ItemIndex+1)+'.'+inttostr(CB_Monat.ItemIndex+1));
    end else
      auslese.Add(buffer);

  until eof(datei);
  closefile(datei);
  if(gefunden = false) then
    auslese.Add('Abgabedatum='+inttostr(CB_Tag.ItemIndex+1)+'.'+inttostr(CB_Monat.ItemIndex+1));
  auslese.SaveToFile(Ordner_data + '\Einstellungen.inf');
end;

procedure TForm10.FormCreate(Sender: TObject);
var
  datei: Textfile;
  buffer: string;
  gefunden: boolean;
begin
  Assignfile(datei, Ordner_data + '\Einstellungen.inf');
  reset(datei);
  repeat
    readln(datei, buffer);

    if( pos('Abgabedatum', buffer) > 0) then
    begin
      gefunden := true;
      delete(buffer,1,12);
      Abgabedatum := strtodate2(buffer + '.2010');
      CB_Monat.ItemIndex := abgabedatum.Monat -1;
      CB_Tag.ItemIndex := abgabedatum.Tag -1;
    end else
  until eof(datei);
  closefile(datei);
end;

end.
