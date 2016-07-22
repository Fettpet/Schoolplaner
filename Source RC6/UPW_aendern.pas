unit UPW_aendern;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UVerschluesselung, UPfad;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ED_PW: TEdit;
    Ed_PW2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
  Datei: Textfile;
  buffer: array[0..7] of String;
  i: integer;
begin
  if( ED_PW.Text = ED_PW2.Text) then
  begin
  // Datei auslesen
    assignfile(datei, Ordner_data + '\Lehrer\' + Form1.get_kuerzel() + '.leh');
    reset(datei);
    for i:=1 to 7 do
    begin
      readln(datei,buffer[i]);
    end;

    closefile(datei);
  // Datei neu anlegen
    assignfile(datei, Ordner_data + '\Lehrer\' + Form1.get_kuerzel() + '.leh');
    rewrite(datei);
    buffer[1] := verschluesselung(ED_PW.Text);
    for i:=1 to 6 do
    begin
      writeln(datei,buffer[i]);
    end;
    closefile(datei);
  end else
  begin
    showmessage('Die Passwörter stimmen nicht überein');
    ED_Pw.Clear();
    ed_pw2.Clear();
    ed_pw.SetFocus();
  end;
  showmessage('PW erfolgreich geändert');
  close;
end;

end.
