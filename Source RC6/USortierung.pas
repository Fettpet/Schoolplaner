unit USortierung;

interface       

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Grids, math, Udatum;

  procedure SG_sort( SG_aktu: pointer; Spalte, Zeile: Integer);
  procedure Combox_sort( CB_aktu: pointer);

implementation

procedure SG_sort( SG_aktu: pointer; Spalte, Zeile: Integer);
var
  SG: ^TStringgrid;
  i, j: integer;
  buffer: string;
  ende: boolean;
begin
  SG := @SG_aktu;
  repeat
    ende := true;

    for i:= 1+Zeile to SG.RowCount-1 do
    begin
      if( lowercase( SG.Cells[ Spalte, i-1]) > lowercase(SG.Cells[ Spalte, i])) then
      begin
        ende := false;
        for j := 0 to SG.ColCount do
        begin
          buffer := SG.Cells[ j, i-1] ;
          SG.Cells[ j, i-1] := SG.Cells[ j, i];
          SG.Cells[ j, i]  := buffer;
        end;
      end;
    end;
  until (ende = true);
end;

procedure Combox_sort( CB_aktu: pointer);
var
  CB: ^TCombobox;
  i: INteger;
  buffer: String;
  ende: boolean;
begin
  CB := @CB_aktu;
  repeat
    ende := true;

    for i:= 1 to CB.ItemIndex-1 do
    begin
      if( lowercase( CB.Items[ i-1]) > lowercase(CB.Items[ i])) then
      begin
        ende := false;
        buffer := CB.Items[i-1] ;
        CB.Items[i-1] := CB.Items[i];
        CB.Items[i]  := buffer;
      end;
    end;
  until (ende = true);
end;

end.
 