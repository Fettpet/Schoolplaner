unit U_Jahr_Loeschen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UPfad;

type
  TForm8 = class(TForm)
    CB_Jahr: TComboBox;
    B_delete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure B_deleteClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form8: TForm8;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
var
  f : TSearchRec;
  s : Integer;
  buffer: string;
begin
// Das aktuelle Jahr rausfinden

// Alle Jahre einlesen
  s := FindFirst(Ordner_data + '\Schuljahre\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      if( Pos('.jah', buffer) > 0) then
        CB_Jahr.Items.Add(Copy(buffer, 1, length(buffer)-4));

      s := FindNext(f);
    end;

  finally
    FindClose(f);
  end;
end;

procedure TForm8.B_deleteClick(Sender: TObject);
var
  f : TSearchRec;
  s : Integer;
  jahr, buffer: string;
begin
  if( CB_Jahr.ItemIndex = -1) then
  begin
    showmessage('Bitte Jahr wählen');
    exit;
  end;
  jahr := CB_Jahr.Items[ CB_Jahr.itemindex ];



// Alle Lehrer im Jahr löschen
  s := FindFirst(Ordner_data + '\Urlaub\' + Jahr + '\*.*', faDirectory, f);
  try
    while s = 0 do
    begin
      buffer := f.Name;
      deletefile(Ordner_data + '\Urlaub\' + Jahr + '\' + buffer);
      s := FindNext(f);
    end;

  finally
    FindClose(f);
  end;
  if(removedir(Ordner_data + '\Urlaub\' + Jahr + '\') = false) then
    showmessage('Ordner Data\Urlaub\' + Jahr + ' konnte nicht gelöscht werden. Bitte Manuell machen');
  deletefile(Ordner_data + '\Schuljahre\' + Jahr + '.jah');

  Form8.CB_Jahr.Clear;
  Form8.FormCreate(Sender);
  Form1.CB_Jahreswahl.Clear();
  Form1.FormCreate(Sender);

end;

end.
