program v01;
const SUITNUMBERS = 13;
      DECKSIZE = 52;
      TWO = 100;
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

TYPE SuitsValue = ARRAY [1..SUITNUMBERS] of integer; {обьявление типа массива}
     Pdeck = ARRAY [1..DECKSIZE] of integer; {обьявление типа массива}
VAR SuitsValues : SuitSValue = (TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,ACE);
    DECK : Pdeck; {массив колоды}
    curindex : integer;
    counter : integer;
    idcount : integer;


procedure ScreenDeck();
var a:integer;
    begin
     for a:=1 to 52 do
         writeln(DECK[a]);
     end;

begin


  counter:=1;
  curindex:=1;
  idcount:=1;
  repeat
    DECK[counter]:= SuitsValues[idcount];
    idcount:= idcount + 1;
    counter:= counter + 1;
     if idcount>13 then idcount:=1

  until counter =53 ;
  ScreenDeck();



end.

