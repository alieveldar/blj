program v01;
TYPE Tdeck = ARRAY [1..13] of integer; {обьявление типа массива}
     Pdeck = ARRAY [1..52] of integer; {обьявление типа массива}
VAR Deck : Tdeck; {массив идентификаторов}
    Pldeck : Pdeck; {массив колоды}
    curindex : integer;
    counter : integer;
    idcount : integer;
   { ind : integer; {индекс элемента массива}
    val : integer; {вес карты}}
const TWO = 100;
      THREE = 101;
      FOUR = 102;
      FIVE = 103;
      SIX = 104;
      SEVEN = 105;
      EIGHT = 106;
      NINE = 107;
      TEN = 108;
      JACK = 109;
      QUEEN = 110;
      KING = 111;
      ACE = 112;
      SUIT_COUNT = 4;

procedure ScreenDeck();
var a:integer;
    begin
     for a:=1 to 52 do
         writeln(Pldeck[a]);
     end;

begin

  Deck[1]:= TWO;
  Deck[2]:= THREE;
  Deck[3]:= FOUR;
  Deck[4]:= FIVE ;
  Deck[5]:= SIX;
  Deck[6]:= SEVEN;
  Deck[7]:= EIGHT;
  Deck[8]:= NINE;
  Deck[9]:= TEN;
  Deck[10]:= JACK ;
  Deck[11]:= QUEEN ;
  Deck[12]:= KING ;
  Deck[13]:= ACE ;
  counter:=1;
  curindex:=1;
  idcount:=1;
  repeat
    Pldeck[counter]:= Deck[idcount];
    idcount:= idcount + 1;
    counter:= counter + 1;
     if idcount>13 then idcount:=1

  until counter =53 ;
  ScreenDeck();



end.

