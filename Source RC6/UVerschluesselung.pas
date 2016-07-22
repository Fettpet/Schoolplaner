unit UVerschluesselung;

interface

    function verschluesselung( s: string): string;
    function entschluesselung( s: string): string;

implementation

// ganz einfache Verschl�sselung
// beruht  auf Xor
// UNSICHER !!!!!!
function verschluesselung(s: string): string;
var
i:integer;
begin

  for i:=1 to length(s) do begin
    s[i]:=Chr(Ord(s[i]) + i);
  end;
  result := s;
end;

//  Entschl�sselung
function entschluesselung(s: string): string;
var
i:integer;
begin
  for i:=1 to length(s) do begin
    s[i]:=Chr(Ord(s[i]) - i);
  end;
  result := s;
end;
end.
 