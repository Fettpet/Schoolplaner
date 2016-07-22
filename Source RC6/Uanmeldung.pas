unit Uanmeldung;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UVerschluesselung, Udatum, UPfad;

type
  TForm4 = class(TForm)
    Ed_name: TEdit;
    Ed_PW: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button_Login: TButton;
    procedure Button_LoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_PWKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.Button_LoginClick(Sender: TObject);
var
  datei: textfile;
  buffer: string;
begin
// schauen ob ein Name und ein PW eingegeben wurden
  if( ED_name.text = '') then
  begin
    showmessage('Kein Name eingegeben');
    ED_name.SetFocus;
    exit;
  end;
  if( ED_PW.Text = '') then
  begin
    showmessage('Kein Passwort eingegeben');
    ED_PW.SetFocus;
    exit;
  end;
// testen ob der Loginname existiert
  if( FileExists(Ordner_data + '\Lehrer\' + ED_name.text + '.leh') = false) then
  begin
    showmessage('Benutzername nicht vorhanden');
    exit;
  end;
  assignfile( datei, Ordner_data + '\Lehrer\' + ED_name.text + '.leh');
  reset(Datei);
  readln( Datei, buffer);
  if( entschluesselung(buffer) <> ed_pw.text) then
  BEGIN
    showmessage('Passwort ist falsch');
    closefile(datei);
    exit;
  end;
// name auslesen
  readln( Datei, buffer);
  Form1.set_Name( entschluesselung(buffer));
  Form1.Label_name.Caption := 'Name: ' + entschluesselung(buffer);
// Vorname auslesen
  readln( Datei, buffer);
  form1.set_vorname(buffer);
  Form1.Label_vorname.Caption := 'Vorname: ' +entschluesselung(buffer);
// Geb auslesen
  readln( Datei, buffer);
  form1.set_geb(strtodate2( entschluesselung(buffer) ));
  Form1.Urlaubstage_test(strtodate2(entschluesselung(buffer)));
  Form1.Label_geb.Caption := 'Geburtstag: ' +entschluesselung(buffer);
//  AMtsbezeichnung
  readln( Datei, buffer);
  form1.set_kuerzel( ED_name.text);
  form1.set_amtsbez(entschluesselung(buffer));
  form1.SG_Laden(inttostr(form1.get_jahr()) + '\' + ED_name.text + '.urlaub');
// admin
  readln( Datei, buffer);
  if( entschluesselung(buffer) = 't') then
    form1.set_admin( true)
  else
    form1.set_admin( false);
  closefile(datei);
  Form1.Urlaubstage_test(Form1.geb_aktu );

  Form1.Left := 200;
  Form4.Visible := false;

end;

// wird ausserhalb des Sichtbereiches Platziert
procedure TForm4.FormCreate(Sender: TObject);
begin
  Uanmeldung.Form4.Show;
  Form1.left := 20000;
  ED_name.SetFocus;

end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form1.Close()
end;

procedure TForm4.Ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
    ED_Pw.SetFocus;
end;

procedure TForm4.Ed_PWKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
    Button_LoginClick(Sender);
end;

end.
