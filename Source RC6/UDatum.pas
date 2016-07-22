unit UDatum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TDatum = record
    Jahr: Word;
    Monat: Byte;
    Tag: Byte;
  end;

  function is_datum( Datum: string): boolean;
  function wochentag(Datum: TDatum): integer;
  function datumsvergleich(Datum1, datum2:TDatum): boolean;
  function tage_anzahl(Monat: Integer): integer;
  function strtodate2(date: String): TDatum;
  function get_tag( datum: string): integer;
  function get_monat( datum: string): integer;

implementation

//Überprüft ob es ein Datum ist
function is_datum( Datum: string): boolean;
var
  tag, monat: integer;
  buffer: string;
  i, j: integer;
  counter: Integer;
begin
  counter := 0; tag := 0; Monat := 0;
  result := true;
  for i:= 1 to length( Datum) do
  begin
// ein Punkt
    if( Datum[i] ='.') then
    begin
// Falls das erste oder das letzte Zeichen ein Punkt ist, Fehler
      if( (i=1) or ( i=length(Datum)) ) then
      begin

        result := false;
        exit;
      end else
      begin
        counter := counter +1;
// Falls bei tage noch nichts definiert wurde
        if( tag = 0) then
          tag := strtoint( Buffer)
        else if( Monat = 0) then
          monat := strtoint( buffer)
        else
        begin
          showmessage(inttostr(counter));
          result := false;
          exit;
        end;
        buffer := '';
      end;
// Eine zahl
    end else if( Datum[i] >= '0') and (Datum[i] <= '9') then
    begin
      buffer := Buffer + Datum[i];
// Falls ein anderes Zeichen als . und zahl
    end else
    begin
      result := false;
      exit;
    end;

  end;
// nochmal schauen ob der Tag und der Monat auch klein genung sind
  if( Monat = 0) or ( Tag = 0) then
  begin
    result := false;
    exit;
  end;

  if (Monat >= 1) and ( Monat <= 12) then
    if( tag > tage_anzahl(Monat) ) then 
      result := false;

  
end;


// Verwandelt ein String in ein Datum
// Das Datum muss fehlerfrei sein
function strtodate2(date: String): TDatum;
var
  ruckgabe: TDatum;
  buffer: string;
  counter, i: integer;
begin
  counter := 0;
  for i:= 1 to length(date) do
  begin
    if( date[i] <> '.') then
      buffer := buffer + date[i]
    else begin
      counter := counter + 1;
      if( counter = 1) then
        ruckgabe.Tag := strtoint(buffer)
      else if( counter = 2) then
        ruckgabe.Monat := strtoint(buffer);
      buffer := '';

    end;
  end;
  ruckgabe.Jahr := strtoint(buffer);
  result := ruckgabe;
end;

// Gibt True zurück wenn 1 größer als 2 ist, ansonsten false
function datumsvergleich(Datum1, datum2:TDatum): boolean;
begin
  if(Datum1.Jahr > Datum2.Jahr) then
    result := true
  else if(Datum1.Jahr < Datum2.Jahr) then
    result := False
  else begin
    if(Datum1.Monat > Datum2.Monat) then
      result := true
    else if(Datum1.Monat < Datum2.Monat) then
      result := false
    else begin
     if(Datum1.Tag > Datum2.Tag) then
       result := true
      else
       result := false;
    end;
  end;
end;

// rechnet aus einem Datum einen Wochentag aus
function wochentag(Datum: TDatum): integer ;
begin
    if datum.Monat <= 2 then
    begin
      Datum.Monat := Datum.Monat + 12;
      Datum.Jahr := Datum.Jahr -1;
    end;

    result := (datum.tag +
              floor(((Datum.Monat + 1) * 26) / 10) +
              strtoint(copy(inttostr(Datum.jahr),3,2)) +
              floor(strtoint(copy(inttostr(Datum.jahr),3,2))/4) +
              floor(strtoint(copy(inttostr(Datum.jahr),1,2))/4) -2* strtoint(copy(inttostr(Datum.jahr),1,2)))
              mod 7 ;
    if result < 0 then result := result + 7;

end;

// Ließt aus dem eingegeben Datum den Tag aus
function get_tag( datum: string): integer;
begin
  if(length(Datum) >= 3) then
  begin
    if(Datum[1] >= '0') and ( Datum[1] <= '9') then
    begin
      if( Datum[2] = '.') then
      begin
        result:= strtoint(Datum[1]);
        exit;
      end else if(Datum[2] >= '0') and ( Datum[2] <= '9') then
      begin
        result := strtoint(Datum[1]) * 10 + strtoint(Datum[2]);
        exit;
      end;
    end;
  end;
  result := 0;
end;

//Nimmt ein Datum an und sagt wie viele Tage dieser Monat hat
function tage_anzahl(Monat: Integer): integer;
begin
  case Monat of
  1,3,5,7,8,10,12:
    begin
      result := 31
    end;
  4,6,9,11:
    begin
        result := 30;
    end;
  2:
    begin
        result := 28;
    end;
  end;

end;

// Ließt aus dem eingegeben Datum den Monat aus
function get_monat( datum: string): integer;
begin
 //Den tag rauslesen.
  if(Datum[2] = '.') then
  begin
    if( length(Datum) > 3) then
    begin
      result := strtoint(Datum[3]) * 10 + strtoint( Datum[4]);
      exit;
    end else
    begin
      result := strtoint(Datum[3]);
      exit;
    end;
  end else begin
    if( length(Datum) > 4) then
    begin
      result := strtoint(Datum[4]) * 10 + strtoint( Datum[5]);
      exit;
    end else
    begin
      result := strtoint(Datum[4]);
      exit;
    end;
  end;
end;

end.
