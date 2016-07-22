unit UNeuer_Lehrer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UVerschluesselung, UDatum, UPfad;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button_anlegen: TButton;
    Ed_na: TEdit;
    Ed_vna: TEdit;
    Ed_geb: TEdit;
    Ed_amt: TEdit;
    Ed_login: TEdit;
    Ed_pw: TEdit;
    Ed_pw2: TEdit;
    CB_admin: TCheckBox;
    procedure Button_anlegenClick(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;

implementation

uses U_Lehrer_Ubersicht, ULehrer_bearbeiten;

{$R *.dfm}

procedure TForm3.Button_anlegenClick(Sender: TObject);
var
  Datei: textfile;
  buffer: string;
  i: integer;
begin
  // schauen ob überall was drin steht
  if(ED_na.text = '') then
  begin
    showmessage('Bei Name steht nichts drin');
    ED_na.SetFocus;
    exit;
  end;
  if(ED_vna.text = '') then
  begin
    showmessage('Beim Vorname steht nichts drin');
    ED_vna.SetFocus;
    exit;
  end;
  if(ED_geb.text = '') then
  begin
    showmessage('Beim Geburtstag steht nichts drin');
    ED_geb.SetFocus;
    exit;
  end;
  if(ED_login.text = '') then
  begin
    showmessage('Beim Loginname steht nichts drin');
    ED_login.SetFocus;
    exit;
  end;
  if(ED_pw.text = '') then
  begin
    showmessage('Bei Passwort steht nichts drin');
    ED_pw.SetFocus;
    exit;
  end;
  if(ED_pw2.text = '') then
  begin
    showmessage('Bei der Passwort bestätigung steht nichts drin');
    ED_PW2.SetFocus;
    exit;
  end;

// Passwort und Passwort bestätigung müssen gleich sein
  if(ED_PW.Text <> ED_PW2.Text) then
  begin
    showmessage('Passwort und Bestätitung stimmen nicht überein');
    ED_Pw.Clear;
    ed_pw2.Clear;
    ED_pw.SetFocus;
    exit;
  end;

// Geburtsdatum überprüfen
  if( is_datum( ED_geb.Text) = false) then
  begin
    showmessage('Geburtsdatum ist fehlerhaft');
    exit;
  end;

// In Datei schreiben
  
  AssignFile(Datei, Ordner_data + '\Lehrer\' + ed_login.Text + '.leh');
  Rewrite(Datei);

// Zuerst kommt das Passwort
  buffer := verschluesselung( ED_pw.Text);
  writeln( Datei, buffer);
// Danach der Name
  buffer := verschluesselung( ED_na.Text);
  writeln( Datei, buffer);
// VOrname
  buffer := verschluesselung( ED_vna.Text);
  writeln( Datei, buffer);
// Geburtsdatum
  buffer := verschluesselung( ED_geb.Text);
  writeln( Datei, buffer);
// Amtsbezeichnung
  buffer := verschluesselung( ED_amt.Text);
  writeln( Datei, buffer);
//admin
  if( CB_admin.Checked = true) then
    buffer := verschluesselung('t')
  else
    buffer := verschluesselung('f');
  writeln( Datei, buffer);
  closefile(Datei);
  //Aktuallisieren
  Form6.SG_Uebersicht.CleanupInstance();
  Form6.FormCreate(Sender);
  Form7.CB_Lehrer.Clear();
  Form7.FormCreate(Sender);

end;


end.
