program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UJahr in 'UJahr.pas' {Form2},
  UNeuer_Lehrer in 'UNeuer_Lehrer.pas' {Form3},
  UVerschluesselung in 'UVerschluesselung.pas',
  Uanmeldung in 'Uanmeldung.pas' {Form4},
  UPW_aendern in 'UPW_aendern.pas' {Form5},
  U_Lehrer_Ubersicht in 'U_Lehrer_Ubersicht.pas' {Form6},
  ULehrer_bearbeiten in 'ULehrer_bearbeiten.pas' {Form7},
  USortierung in '..\Nachhilfe\USortierung.pas',
  U_Jahr_Loeschen in 'U_Jahr_Loeschen.pas' {Form8},
  U_Urlaub_anpassen in 'U_Urlaub_anpassen.pas' {Form9},
  UAntrag in 'UAntrag.pas',
  U_abgabedatum in 'U_abgabedatum.pas' {Form10},
  U_fehlendeAntraege in 'U_fehlendeAntraege.pas' {Form11},
  UPfad in 'UPfad.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
