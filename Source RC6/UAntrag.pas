unit UAntrag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UVerschluesselung, Udatum;

type
  TAntrag = class(TForm)
  private
    name, vorname, kuerzel, Amtsbez, Urlaubsdatei: string;
  public
    constructor create( na, vna, kue, amts, Urldatei: string);
  end;


implementation

constructor TAntrag.create( na, vna, kue, amts, Urldatei: string);
begin
  name := na;
  vorname := vna;
  kuerzel := kue;
  amtsbez := amts;
  Urlaubsdatei := Urldatei;
end;

end.
