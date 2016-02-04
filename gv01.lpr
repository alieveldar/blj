program v01;
const SUIT_NUMBERS = 13;
      DECK_SIZE = 52;

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



VAR SuitsValues :ARRAY [1..SUIT_NUMBERS] of integer = (TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,ACE);
    DECK : ARRAY [1..DECK_SIZE] OF INTEGER; {массив колоды}
    counter : integer;
    idcount : integer;


procedure PrintDeck();
var a:integer;
    begin
     for a:=1 to DECK_SIZE do
         writeln(DECK[a]);
     end;

begin


  counter:=1;
  idcount:=1;
  repeat
    DECK[counter]:= SuitsValues[idcount];
    idcount:= idcount + 1;
    counter:= counter + 1;
     if idcount>SUIT_NUMBERS then idcount:=1

  until counter = DECK_SIZE + 1 ;
  PrintDeck();



end.

