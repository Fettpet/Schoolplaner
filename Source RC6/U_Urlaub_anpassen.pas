unit U_Urlaub_anpassen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDatum, UPfad;

type
  TForm9 = class(TForm)
    Label_von_1: TLabel;
    Label_bis_1: TLabel;
    ED_von_1: TEdit;
    ED_bis_1: TEdit;
    Label_von_2: TLabel;
    Label_bis_2: TLabel;
    ED_von_2: TEdit;
    ED_bis_2: TEdit;
    Label_von_3: TLabel;
    Label_bis_3: TLabel;
    ED_von_3: TEdit;
    ED_bis_3: TEdit;
    Label_von_4: TLabel;
    Label_bis_4: TLabel;
    ED_von_4: TEdit;
    ED_bis_4: TEdit;
    Label_von_5: TLabel;
    Label_bis_5: TLabel;
    ED_von_5: TEdit;
    ED_bis_5: TEdit;
    Label_von_6: TLabel;
    Label_bis_6: TLabel;
    ED_von_6: TEdit;
    ED_bis_6: TEdit;
    Label_von_7: TLabel;
    Label_bis_7: TLabel;
    ED_von_7: TEdit;
    ED_bis_7: TEdit;
    Button1: TButton;
    Label17: TLabel;
    Label_frei_1: TLabel;
    ED_frei_1: TEdit;
    Label_frei_2: TLabel;
    ED_frei_2: TEdit;
    Label_frei_3: TLabel;
    ED_frei_3: TEdit;
    Label_frei_4: TLabel;
    ED_frei_4: TEdit;
    Label_frei_5: TLabel;
    ED_frei_5: TEdit;
    Label_frei_6: TLabel;
    ED_frei_6: TEdit;
    Label_frei_7: TLabel;
    ED_frei_7: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function is_integer(zahl: string): boolean;
  private
    Ed_frei, ED_von, ED_bis: Array[0..8] of ^TEdit;
    anz:Integer;
  public
    function get_freitage(geb: TDatum; aktuelles_jahr:Integer):integer;
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}


function TForm9.get_freitage(geb: TDatum; aktuelles_jahr:Integer):integer;
var
  alter, i: Integer;
begin
  result := 0;
  alter := aktuelles_jahr - geb.Jahr;
  for i:=1 to anz do
  begin
    if(strtoint(ED_von[i].Text) <= alter) and (strtoint(ED_bis[i].Text) >= alter) then
    begin
      result := strtoint(ED_frei[i].Text);
      break;
    end;
  end;
end;

procedure TForm9.FormCreate(Sender: TObject);
var
 datei: Textfile;
 buffer: string;
 i: Integer;
begin
//Frei
  ED_frei[1] := @ED_frei_1;
  ED_frei[2] := @ED_frei_2;
  ED_frei[3] := @ED_frei_3;
  ED_frei[4] := @ED_frei_4;
  ED_frei[5] := @ED_frei_5;
  ED_frei[6] := @ED_frei_6;
  ED_frei[7] := @ED_frei_7;


//von
  ED_bis[1] := @ED_bis_1;
  ED_bis[2] := @ED_bis_2;
  ED_bis[3] := @ED_bis_3;
  ED_bis[4] := @ED_bis_4;
  ED_bis[5] := @ED_bis_5;
  ED_bis[6] := @ED_bis_6;
  ED_bis[7] := @ED_bis_7;


//von
  ED_von[1] := @ED_von_1;
  ED_von[2] := @ED_von_2;
  ED_von[3] := @ED_von_3;
  ED_von[4] := @ED_von_4;
  ED_von[5] := @ED_von_5;
  ED_von[6] := @ED_von_6;
  ED_von[7] := @ED_von_7;

  //Einlesen;
  assignfile(datei, Ordner_data + '\Urlaub\frei.urlaub');
  reset(datei);
  readln(datei, buffer);
  anz := strtoint(buffer);
  for i:=1 to anz do
  begin
    readln(datei, buffer);
    ED_von[i].text := buffer;
    readln(datei, buffer);
    ED_bis[i].text := buffer;
    readln(datei, buffer);
    ED_frei[i].text := buffer;
  end;
  closefile(datei);
end;

procedure TForm9.Button1Click(Sender: TObject);
var
  i: INteger;
  datei: Textfile;
begin
// Rausfinden ab welcher Zeile irgentwo etwas nicht mehr drin steht
  anz := 0;
  for i:= 1 to 7 do
  begin
    if( length(ED_von[i].text) = 0) or ( length(ED_bis[i].text) = 0) or ( length(ED_frei[i].text) = 0) then
    begin
      if( length(ED_von[i].text) = 0) and ( length(ED_bis[i].text) = 0) and ( length(ED_frei[i].text) = 0) then
      begin
       anz := i-1;
       break;
      end;
       if( length(ED_von[i].text) = 0) then
       begin
         showmessage('In Zeile ' + inttostr(i) + ' steht in der von Eingabe nichts drin');
         ED_von[i].SetFocus;
         exit;
       end;
       if( length(ED_bis[i].text) = 0) then
       begin
        showmessage('In Zeile ' + inttostr(i) + ' steht in der Bis Eingabe nichts drin');
        ED_von[i].SetFocus;
        exit;
      end;
      if( length(ED_frei[i].text) = 0) then
      begin
        showmessage('In Zeile ' + inttostr(i) + ' steht in der Frei Eingabe nichts drin');
        ED_von[i].SetFocus;
        exit;
      end;
      if( is_integer(ED_von[i].Text) = false) then
      begin
        showmessage('In Zeile ' + inttostr(i) + ' steht in der von Eingabe keine ganze Zahl drin');
        ED_von[i].SetFocus;
        exit;
      end;

      if( is_integer(ED_bis[i].Text) = false) then
      begin
        showmessage('In Zeile ' + inttostr(i) + ' steht in der Bis Eingabe keine ganze Zahl drin');
        ED_von[i].SetFocus;
        exit;
      end;

      if( is_integer(ED_frei[i].Text) = false) then
      begin
        showmessage('In Zeile ' + inttostr(i) + ' steht in der Frei Eingabe keine ganze Zahl drin');
        ED_von[i].SetFocus;
        exit;
      end;
    end;
   end;
  assignfile(datei, Ordner_data + '\Urlaub\frei.urlaub');
  rewrite(datei);
  writeln(datei, inttostr(anz));
  for i:=1 to anz do
  begin
    writeln(datei, ED_von[i].text);
    writeln(datei, ED_bis[i].text);
    writeln(datei, ED_frei[i].text);
  end;
  closefile(datei);
end;

// schaut nach, ob eine String zahl wirklich nur aus zahlen besteht
function TForm9.is_integer( Zahl: string): boolean;
var
  i:Integer;
begin
    result := true;
    if( zahl <> '') then
    begin
      for i:= 1 to length(Zahl) do
      begin
       if(Zahl[i] < '0') or ( Zahl[i] > '9') then
       begin
         result := false;
         break;
       end;
     end;
    end else
      result := false;
end;
end.
