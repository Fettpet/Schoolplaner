unit ULehrer_bearbeiten;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UVerschluesselung, Udatum, USortierung;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CB_Admin: TCheckBox;
    ED_Name: TEdit;
    ED_vorname: TEdit;
    Ed_Amts: TEdit;
    ED_geb: TEdit;
    B_save: TButton;
    B_delete: TButton;
    CB_Lehrer: TComboBox;
    Label5: TLabel;
    procedure B_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CB_LehrerChange(Sender: TObject);
    procedure B_deleteClick(Sender: TObject);


  private
    { Private-Deklarationen }
  public
    procedure set_Kuerzel( Kuerzel: string);
  end;

var
  Form7: TForm7;
  buffer: array[0..6] of String;
implementation

uses U_Lehrer_Ubersicht, U_Jahr_Loeschen;

{$R *.dfm}
// Aus einem anderem Formular heraus starten
procedure TForm7.set_Kuerzel( Kuerzel: string);
var
  Datei: Textfile;

  i: integer;
begin
      buffer[0] := Kuerzel;
// Auslesen

        Assignfile(datei, 'Data\Lehrer\' + Kuerzel + '.leh');

        reset(datei);
        //PW auslesen
          readln(datei, buffer[1]);
        // Name Auslesen

          readln(datei, buffer[2]);
          ED_Name.Text := entschluesselung(buffer[2]);
        // Vorname Auslesen

          readln(datei, buffer[3]);
          ED_Vorname.Text := entschluesselung(buffer[3]);
        // geb Auslesen

          readln(datei, buffer[4]);
          ED_geb.Text := entschluesselung(buffer[4]);
        // Amtsbez Auslesen

          readln(datei, buffer[5]);
          ED_Amts.Text := entschluesselung(buffer[5]);
        // Admin Auslesen

          readln(datei, buffer[6]);

          if(entschluesselung(buffer[6]) = 't') then
            CB_Admin.Checked := true
          else
            CB_Admin.Checked := false;

          closefile(datei);
      for i := 0 to CB_Lehrer.ItemHeight do
      begin
        if( CB_Lehrer.Items[i] = kuerzel) then
        begin
          CB_Lehrer.ItemIndex := i;
          break;
        end;
      end;
end;


procedure TForm7.B_saveClick(Sender: TObject);
var
  i: Integer;
  Datei:  Textfile;
begin
  // schauen ob überall was drin steht
  if(ED_name.text = '') then
  begin
    showmessage('Bei Name steht nichts drin');
    ED_name.SetFocus;
    exit;
  end;
  if(ED_vorname.text = '') then
  begin
    showmessage('Beim Vorname steht nichts drin');
    ED_vorname.SetFocus;
    exit;
  end;
  if(ED_geb.text = '') then
  begin
    showmessage('Beim Geburtstag steht nichts drin');
    ED_geb.SetFocus;
    exit;
  end;
  if(ED_Amts.text = '') then
  begin
    showmessage('Bei der Amtsbezeichnung steht nichts drin');
    ED_Amts.SetFocus;
    exit;
  end;

  // Geburtsdatum überprüfen
  if( is_datum( ED_geb.Text) = false) then
  begin
    showmessage('Geburtsdatum ist fehlerhaft');
    exit;
  end;
  //In den Buffer übernehmen
  buffer[2] := verschluesselung( ED_name.Text);
  buffer[3] := verschluesselung( ED_vorname.Text);
  buffer[4] := verschluesselung( ED_geb.Text);
  buffer[5] := verschluesselung(ED_amts.Text);

  if( CB_Admin.Checked = true) then
    buffer[6] := verschluesselung('t')
  else
    buffer[6] := verschluesselung('f');


// In Datei schreiben
    Assignfile(datei, 'Data\Lehrer\' + buffer[0] + '.leh');
    rewrite(datei);
    for i:= 1 to 6 do
      writeln( datei, buffer[i]);
    closefile(datei);
end;

procedure TForm7.FormCreate(Sender: TObject);
var
  f : TSearchRec;
  s : Integer;
  buffer: string;
begin

// Alle Lehrer einlesen
  s := FindFirst('Data\Lehrer\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      if( Pos('.leh', buffer) > 0) then
        CB_Lehrer.Items.Add(Copy(buffer, 1, length(buffer)-4));

      s := FindNext(f);
    end;
      CB_Lehrer.ItemIndex := 0;
      set_kuerzel( CB_Lehrer.Items[0]);
  finally
    FindClose(f);
  end;
end;

procedure TForm7.CB_LehrerChange(Sender: TObject);
begin
  set_kuerzel( CB_Lehrer.Items[ CB_Lehrer.itemIndex]);
end;

procedure TForm7.B_deleteClick(Sender: TObject);
var
  Lehrer: String;
  f : TSearchRec;
  s : Integer;
  buffer: string;
  Ordner: string;
begin
  lehrer := CB_Lehrer.Items[ CB_Lehrer.ItemIndex];
// Lehrer Löschen
  if( Fileexists('Data\Lehrer\' +  Lehrer + '.leh') = true) then
  begin
    deletefile('Data\Lehrer\' +  Lehrer + '.leh');
// Urlaub löschen
    s := FindFirst('Data\Urlaub\*.*', faDirectory, f);
    try
      while s = 0 do
      begin
        buffer := f.Name;
        if( Pos('.', buffer) = 0) then
        begin

          if( Fileexists('Data\Urlaub\' + buffer + '\' +  Lehrer + '.urlaub') = true) then
            deletefile('Data\Urlaub\' + buffer + '\' +  Lehrer + '.urlaub');
        end;

        s := FindNext(f);
      end;

    finally
      FindClose(f);
    end;
    showmessage('Lehrer Erfolgreich gelöscht');
  end else
    showmessage('Lehrer nicht gefunden');
  //Aktuallisieren
  Form6.SG_Uebersicht.CleanupInstance();
  Form6.nr := Form6.nr - 1; 
  Form6.FormCreate(Sender);
  Form7.CB_Lehrer.Clear();
  Form7.FormCreate(Sender);
end;

end.


procedure TForm1.FormCreate(Sender: TObject);

begin


// Alle Jahre einlesen
  s := FindFirst('Data\Lehrer\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      if( Pos('.leh', buffer) > 0) then
        CB_Lehrer.Items.Add(Copy(buffer, 1, length(buffer)-4));

      s := FindNext(f);
    end;
      CB_Jahreswahl.ItemIndex := 0;

  finally
    FindClose(f);
  end;

end;
