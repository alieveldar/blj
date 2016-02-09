program testing;

const
SUIT_CARDS_NUMBER = 13;
SUITS_NUMBER = 4;
DECK_SIZE = SUIT_CARDS_NUMBER * SUITS_NUMBER;

TWO   = 100;
THREE = 101;
FOUR  = 102;
FIVE  = 103;
SIX   = 104;
SEVEN = 105;
EIGHT = 106;
NINE  = 107;
TEN   = 108;
JACK  = 109;
QUEEN = 110;
KING  = 111;
ACE   = 112;
type
DeckType = array of integer;
var
SuitValues: array [1..SUIT_CARDS_NUMBER] of
integer = (TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN,
JACK, QUEEN, KING, ACE);
deck: DeckType;
counter: integer;
suitIndex: integer;
cardInSuitIndex: integer;
hand: integer;

procedure ShuffleDeck(var theDeck: DeckType);
const
shuffletime = 10000;
var
shufflecount1: integer;
shufflecount2: integer;
temp1: integer;
temp2: integer;
a: integer;
begin
Randomize;
for a := 1 to shuffletime do
begin

shufflecount1 := 1 + Random(Length(theDeck));
shufflecount2 := 1 + Random(Length(theDeck));
temp1 := theDeck[shufflecount1];
temp2 := theDeck[shufflecount2];
theDeck[shufflecount1] := temp2;
theDeck[shufflecount2] := temp1;
end;

end;

procedure FillDeck(var theDeck: DeckType);
begin
SetLength(theDeck,DECK_SIZE);
counter := 1;
for suitIndex := 1 to SUITS_NUMBER do
begin
for cardInSuitIndex := 1 to Length(SuitValues) do
begin
deck[counter] := SuitValues[cardInSuitIndex];
counter := counter + 1;
end;
end;
end;


procedure PrintDeck(var theDeck: DeckType);
var
a: integer;
n: integer;
begin
for a := 1 to Length(theDeck) do
begin
n := theDeck[a];

case n of
100: writeln('TWO');
101: WriteLn('THREE');
102: WriteLn('FOUR');
103: WriteLn('FIVE');
104: WriteLn('SIX');
105: WriteLn('SEVEN');
106: WriteLn('EIGHT');
107: WriteLn('NINE');
108: WriteLn('TEN');
109: WriteLn('JACK');
110: WriteLn('QUEEN');
111: WriteLn('KING');
112: WriteLn('ACE');
end;
end;
end;

function PassCard(var theDeck:DeckType):integer;
var temp1:integer;
temp2:integer;
begin
temp1:= Length(theDeck); {52}
temp2:= theDeck[temp1];  {112}
theDeck[temp1]:= 0;   {0}
temp1:= temp1 -1; {51}
Setlength(theDeck, temp1);
PassCard:= temp2;
{writeln('VVVVVVV  ', PassCard);}
end;

procedure PrintUseCArd(temps:integer);
begin
writeln('Card from Deck is ', temps);
end;

procedure CheckDeck(var theDeck:DeckType);
var a:integer;
n:integer;
c:integer;
begin
c:= 0;
writeln('Deck size is  ', Length(theDeck));
for a:=1 to Length(theDeck) do
begin
n:= theDeck[a];
case n of
100: c:= c + 1;
end;
end;
Writeln (c);
end;

begin
FillDeck(deck);
ShuffleDeck(deck);
PrintDeck(deck);
{CheckDeck(deck);}
hand:= PassCard(deck);
PrintUseCard(hand);
{CheckDeck(deck); {Minitest of Deck size and suits} }
PrintDeck(deck);

end.

