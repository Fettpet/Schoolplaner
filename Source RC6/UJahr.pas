unit UJahr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDatum, UPfad;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ED_WIF_von: TEdit;
    Label3: TLabel;
    ED_WIF_bis: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ED_OSF_von: TEdit;
    Label6: TLabel;
    ED_OSF_bis: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ED_SoF_von: TEdit;
    Label9: TLabel;
    ED_SOF_bis: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    ED_HEF_von: TEdit;
    ED_HEF_bis: TEdit;
    W: TLabel;
    ED_WEF_von: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ED_WEF_bis: TEdit;
    Label14: TLabel;
    ED_Jahr: TEdit;
    Memo1: TMemo;
    Label15: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    function is_datum_name( Datum, name: string): boolean;
    function is_integer( Zahl, name: string): boolean;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, U_Jahr_Loeschen;


{$R *.dfm}



procedure TForm2.Button1Click(Sender: TObject);
var
Datei: TextFile;
i,j, l, k,counter, Zusatzdatum_anzahl, Zusatzdatum_anz: Integer;
Jahr: Integer;
buffer_datum: TDatum;
start_datum_Tag, start_datum_Monat :Integer;
end_datum_tag, end_datum_Monat: Integer;
Datumsangaben: array[0..5] of array[0..2] of TDatum;
Zusatzdatum: array of TDatum;
ZUsatzdatum_name: array of String;
datum_Buffer: string;
begin
  // schauen obs wirkliche eine Jahreszahl ist
    //Eingabe Winterferien überprüfen
   if( is_integer(ED_Jahr.Text, 'Jahr') = true) then
    begin
      if(is_datum_name(ED_WIF_von.Text, 'Begin der Winterferien') <> true) then exit
      else if(is_datum_name(ED_WIF_bis.Text, 'Ende der Winterferien') <> true) then exit
    // Eingabe Osterferien testet
      else if(is_datum_name(ED_OSF_von.Text, 'Begin der Osterferien') <> true) then exit
      else if(is_datum_name(ED_OSF_bis.Text, 'Ende der Osterferien') <> true) then exit
    //Eingabe der Sommerferien
      else if(is_datum_name(ED_SOF_von.Text, 'Begin der Sommerferien') <> true) then exit
      else if(is_datum_name(ED_SOF_bis.Text, 'Ende der Sommerferien') <> true) then exit
    // eingabe der Herbstferien
      else if(is_datum_name(ED_HEF_von.Text, 'Begin der Herbstferien') <> true) then exit
      else if(is_datum_name(ED_HEF_bis.Text, 'Ende der Herbstferien') <> true) then exit
    //Weihnachtsferien
      else if(is_datum_name(ED_WEF_von.Text, 'Begin der Weihnachtsferien') <> true) then exit
      else if(is_datum_name(ED_WEF_bis.Text, 'Ende der Weihnachtsferien') <> true) then exit;

      Jahr := strtoint(ED_Jahr.Text);
    //Eingabe der Winterferien
    //Winterferien Begin
        Datumsangaben[1][1].Jahr := Jahr;
        Datumsangaben[1][1].Monat := get_Monat(ED_WIF_von.Text);
        Datumsangaben[1][1].Tag := get_tag(ED_WIF_von.Text);

    //Winterferien ende
        Datumsangaben[1][2].Jahr := Jahr;
        Datumsangaben[1][2].Monat := get_Monat(ED_WIF_bis.Text);
        Datumsangaben[1][2].Tag := get_tag(ED_WIF_bis.Text);

    //Eingabe der Osterferien
    //Osterferien Begin
        Datumsangaben[2][1].Jahr := Jahr;
        Datumsangaben[2][1].Monat := get_Monat(ED_OSF_von.Text);
        Datumsangaben[2][1].Tag := get_tag(ED_OSF_von.Text);

    //Osterferien ende
        Datumsangaben[2][2].Jahr := Jahr;
        Datumsangaben[2][2].Monat := get_Monat(ED_OSF_bis.Text);
        Datumsangaben[2][2].Tag := get_tag(ED_OSF_bis.Text);

    //Eingabe der Sommerferien
    //Sommerferien Begin
        Datumsangaben[3][1].Jahr := Jahr;
        Datumsangaben[3][1].Monat := get_Monat(ED_SOF_von.Text);
        Datumsangaben[3][1].Tag := get_tag(ED_SOF_von.Text);

    //Sommerferien ende
        Datumsangaben[3][2].Jahr := Jahr;
        Datumsangaben[3][2].Monat := get_Monat(ED_SOF_bis.Text);
        Datumsangaben[3][2].Tag := get_tag(ED_SOF_bis.Text);

    //Eingabe der Herbstferien
    //Herbstferien Begin
        Datumsangaben[4][1].Jahr := Jahr;
        Datumsangaben[4][1].Monat := get_Monat(ED_HEF_von.Text);
        Datumsangaben[4][1].Tag := get_tag(ED_HEF_von.Text);

    //Herbstferien ende
        Datumsangaben[4][2].Jahr := Jahr;
        Datumsangaben[4][2].Monat := get_Monat(ED_HEF_bis.Text);
        Datumsangaben[4][2].Tag := get_tag(ED_HEF_bis.Text);

    //Eingabe der Weihnachtsferien
    //Weihnachtsferien Begin
        Datumsangaben[5][1].Jahr := Jahr;
        Datumsangaben[5][1].Monat := get_Monat(ED_WEF_von.Text);
        Datumsangaben[5][1].Tag := get_tag(ED_WEF_von.Text);

    //Weihnachtsferien ende
        Datumsangaben[5][2].Jahr := Jahr + 1;
        Datumsangaben[5][2].Monat := get_Monat(ED_WEF_bis.Text);
        Datumsangaben[5][2].Tag := get_tag(ED_WEF_bis.Text);

    //Test ob Die Datumsangaben auch hinhauen können
    for i:=1 to 5 do
    begin
      if(datumsvergleich(Datumsangaben[i][1], Datumsangaben[i][2]) = true) then
      begin
        showmessage('überprüfen sie die datumsangaben. Ein enddatum ist größer als das Startdatum');
        exit;
      end
    end;

    //Einlesen der Extrazeilen
    if(    Memo1.lines.Count > 0) then
    begin
      Zusatzdatum_anzahl := Memo1.lines.Count;
      setlength( Zusatzdatum, Memo1.lines.Count+1);
      setlength( Zusatzdatum_name, Memo1.lines.Count+1);
      for i:=0 to Memo1.lines.Count-1 do
      begin
        Datum_buffer := '';
        j := 1;
        if((Memo1.Lines[i][1] >= '0') and  (Memo1.Lines[i][1] <= '9')) then
        begin
// Auslesen des Datums
          while(Memo1.Lines[i][j] <> ' ') do
          begin
            Datum_buffer := Datum_buffer +  Memo1.Lines[i][j];
            j := j + 1;
          end;
          if(is_datum_name(Datum_buffer, 'in Zusatzdatums Zeile ' + inttostr(i+1)) =true) then
          begin
           Zusatzdatum[i].Jahr := Jahr;
           Zusatzdatum[i].Monat := get_Monat(Datum_buffer);
           Zusatzdatum[i].Tag := get_Tag( Datum_buffer);
          end else begin
            exit;
          end;
// auslesen des grundes

          while(j <= length(Memo1.Lines[i])) do
          begin
            Zusatzdatum_name[i] := Zusatzdatum_name[i]+  Memo1.Lines[i][j];
            j := j + 1;
          end;

        end else
        begin

        // Auslesen des Datums
          while(Memo1.Lines[i][j] <> ' ') do
          begin
            Zusatzdatum_name[i] := Zusatzdatum_name[i]+  Memo1.Lines[i][j];
            j := j + 1;
          end;

          j:=j+1;
        
          while(j <= length(Memo1.Lines[i])) do
          begin
            Datum_buffer := Datum_buffer +  Memo1.Lines[i][j];
            j := j + 1;
          end;
          if(is_datum_name(Datum_buffer, 'in Zusatzdatums Zeile ' + inttostr(i+1)) =true) then
          begin
           Zusatzdatum[i].Jahr := Jahr;
           Zusatzdatum[i].Monat := get_Monat(Datum_buffer);
           Zusatzdatum[i].Tag := get_Tag( Datum_buffer);
          end else begin
            exit;
          end;
        end;
      end;


    end;
 end;
// Das Auslesen ist fertig. nun wird alles in eine datei gespeichert.
  AssignFile(datei, Ordner_data + '\Schuljahre\' + inttostr(Jahr) + '.jah' );
  Rewrite(datei);

// Die einzelnen Ferien
  for i:=1 to 5 do
  begin
  // in datei schreiben welche ferien
  if( i=1) then
    Writeln(datei, 'Winterferien')
  else if( i=2) then
    Writeln(datei, 'Osterferien')
  else if( i=3) then
    Writeln(datei, 'Sommerferien')
  else if( i=4) then
    Writeln(datei, 'Herbstferien')
  else if( i=5) then
    Writeln(datei, 'Weihnachtsferien');
// Die anzahl der Jahre
    for j:=Datumsangaben[i][1].Jahr to Datumsangaben[i][2].Jahr do
    begin

// abfrage des Startmonats
      if( j = Datumsangaben[i][1].Jahr) then
        start_datum_monat := Datumsangaben[i][1].Monat
      else
        start_datum_monat := 1;
// abfrage des Endmonats
      if( j = Datumsangaben[i][2].Jahr) then
        end_datum_monat := Datumsangaben[i][2].Monat
      else
        end_datum_monat := 12;
      for k:= start_datum_monat to end_datum_monat do
      begin

// abfrage des Starttages
        if( k = Datumsangaben[i][1].Monat) and ( j= Datumsangaben[i][1].Jahr) then
          start_datum_tag := Datumsangaben[i][1].tag
        else
          start_datum_tag := 1;
// abfrage des endtages
        if( k = Datumsangaben[i][2].Monat) and ( j= Datumsangaben[i][2].Jahr) then
          end_datum_tag := Datumsangaben[i][2].tag
        else
          end_datum_tag := tage_anzahl(k);

        for l:= start_datum_tag to end_datum_tag do
        begin
// das Datum zuweißen
          if (i=5) then
          counter := counter +1;
          buffer_datum.Tag := l;
          buffer_datum.Monat := k;
          buffer_datum.Jahr := j;
// test obs ein Wochentag ist
          if( Wochentag(Buffer_Datum) > 1)  then

            Writeln(datei, inttostr(buffer_datum.Tag) + '.' + inttostr(buffer_datum.Monat) + '.' + inttostr(buffer_datum.Jahr));
        end; // ende der Tagessschleife
      end; // ende der Monatsschleife
    end; // Ende der Jahresschleife
// Die Zusatzabfragen an die Passende Stelle schreiben

// Zusätzliche Freie Tage einlesen
   if( i < 5) then
   begin
    Zusatzdatum_anz := 0;
    for k:=0 to Zusatzdatum_anzahl-1 do
    begin
     if( datumsvergleich(Zusatzdatum[k], Datumsangaben[i][2]) and datumsvergleich(Datumsangaben[i+1][1], Zusatzdatum[k])) then
     begin
        Zusatzdatum_anz := Zusatzdatum_anz + 1;

     end;
    end;
    if( Zusatzdatum_anz > 0) then
    begin
      writeln(Datei, 'Zusatz');
      writeln(Datei, inttostr(Zusatzdatum_anz  ));
      for k:=0 to Zusatzdatum_anzahl-1  do
      begin
        if( datumsvergleich(Zusatzdatum[k], Datumsangaben[i][2]) and datumsvergleich(Datumsangaben[i+1][1], Zusatzdatum[k])) then
        begin
          writeln(Datei, Zusatzdatum_name[k]);
          writeln(Datei, inttostr(Zusatzdatum[k].Tag) + '.' +  inttostr(Zusatzdatum[k].Monat) +  '.' + inttostr(Zusatzdatum[k].Jahr));
        end;
      end;
    end;
   end;
  end; // ende der einzelnen Ferien



  CloseFile(datei);

// einen Ordner in Urlaub erstellen
  if( DirectoryExists(Ordner_data + '\Urlaub\' + inttostr(Jahr)) = false) then
    MkDir(Ordner_data + '\Urlaub\' + inttostr(Jahr));

  Assignfile(datei, Ordner_data + '\Abgabe\'+inttostr(jahr)+'.abg');
  rewrite(datei);
  closefile(datei);
//Aktualisieren
  Form8.CB_Jahr.Clear;
  Form8.FormCreate(Sender);
  Form1.CB_Jahreswahl.Clear();
  Form1.FormCreate(Sender);
end;


// schaut nach, ob eine String zahl wirklich nur aus zahlen besteht
function TForm2.is_integer( Zahl, name: string): boolean;
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
         showmessage('Unzulässiges Zeichen');
         result := false;
         break;
       end;
     end;
    end else
    begin
      showmessage('Keine Eingabe bei ' + name);
      result := false;
    end;
end;

//Überprüft ob es ein Datum ist
function TForm2.is_datum_name( Datum, name: string): boolean;
var
  tag, monat: integer;
begin
  tag := 0;
  monat := 0;
  // schauen obs überhaupt ein datum sein kann
  if(length(Datum) >= 3) then
  begin
    if(Datum[1] >= '0') and ( Datum[1] <= '9') then
    begin
      if( Datum[2] = '.') then
      begin
        tag := strtoint(Datum[1]);

        if(Datum[3] >= '0') and ( Datum[3] <= '9') then
        begin
          if(length(Datum) = 4) then
            if(Datum[4] >= '0') and ( Datum[4] <= '9') then
            begin
              monat := strtoint(Datum[3]) * 10 + strtoint( Datum[4]);
            end else
              showmessage('Fehlerhaftes Zeichen bei ' + name)
          else begin
             monat := strtoint(Datum[3]);
          end;

        end else
          showmessage('Fehlerhaftes zeichen bei ' + name);

      end else if( Datum[2] >= '0') and (Datum[2] <= '9') then
      begin
        tag := strtoint(Datum[1]) * 10 + strtoint(Datum[2]);;
        if( Datum[3] = '.') then
        begin
          if(Datum[4] >= '0') and ( Datum[4] <= '9') then
          begin
            if(length(Datum) = 5) then
              if(Datum[5] >= '0') and ( Datum[5] <= '9') then
              begin
                monat := strtoint(Datum[4]) * 10 + strtoint( Datum[5]);
              end else
                showmessage('Fehlerhaftes Zeichen bei ' + name)
            else begin
               monat := strtoint(Datum[4]);
            end;

          end else
            showmessage('Fehlerhaftes zeichen bei ' + name);
        end else
          showmessage('Fehlerhaftes Format (TT.MM) bei ' + name);
      end else
         showmessage('Fehlerhaftes zeichen bei ' + name);
    end else
      showmessage('Fehlerhaftes zeichen bei ' + name);
  end else
    showmessage('Fehlerhaftes Format (TT.MM) bei ' + name);


  case Monat of
  1,3,5,7,8,10,12:
    begin
      if(Tag > 31) then
      begin
        result := false;
        showmessage(inttostr(monat) + 'Tag ist zu groß bei' + name);
      end else
        result := true;
    end;
  4,6,9,11:
    begin
      if(Tag > 30) then
      begin

        result := false;
        showmessage(inttostr(tag) + 'Tag ist zu groß bei ' + name);
      end else
        result := true;
    end;
  2:
    begin
      if(Tag > 29) then
      begin
        result := false;
        showmessage('Tag ist zu groß bei' + name);
      end else
        result := true;
    end;
  else
    result := false;

  end;
end;
end.
