program v01;
{внимание некоторые переменные не используются}
TYPE SuiVal = ARRAY [1..13] of integer; {обьявление типа массива}
     Pdeck = ARRAY [1..52] of integer; {обьявление типа массива}
VAR SuitValues : SuiVal; {массив идентификаторов}
    Pldeck : Pdeck; {массив колоды}
    curindex : integer;
    counter : integer;
    idcount : integer;
   { ind : integer; индекс элемента массива}
    {val : integer; вес карты}
const
{VALUES_IN_SUIT = 13;
DeckSize = 52;     Constants can not use to set the dimension of the array}
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
{SUIT_COUNT = 4; }

procedure ScreenDeck();
var a:integer;
begin
     for a:=1 to 52 do
     writeln(Pldeck[a]);
end;

begin

SuitValues[1]:= TWO;
SuitValues[2]:= THREE;
SuitValues[3]:= FOUR;
SuitValues[4]:= FIVE;
SuitValues[5]:= SIX;
SuitValues[6]:= SEVEN;
SuitValues[7]:= EIGHT;
SuitValues[8]:= NINE;
SuitValues[9]:= TEN;
SuitValues[10]:= JACK;
SuitValues[11]:= QUEEN;
SuitValues[12]:= KING;
SuitValues[13]:= ACE;
counter:=1;
curindex:=1;
idcount:=1;
  repeat
    Pldeck[counter]:= SuitValues[idcount];
    idcount:= idcount + 1;
    counter:= counter + 1;
    if idcount>13 then idcount:=1
    until counter =53;
    ScreenDeck();



end.

