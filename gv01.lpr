program v01;
<<<<<<< HEAD
const SUIT_CARDS_NUMBER = 13;
      SUITS_NUMBER      = 4;
      DECK_SIZE         = SUIT_CARDS_NUMBER * SUITS_NUMBER;
 
      TWO   = 100;
=======
const SUIT_NUMBERS = 13;
      DECK_SIZE    = 52;

const TWO   = 100;
>>>>>>> 1028169863bfdad487492ca51e5e4f4e9baeb145
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
<<<<<<< HEAD
type
=======
>>>>>>> 1028169863bfdad487492ca51e5e4f4e9baeb145

	DeckType = ARRAY [1..DECK_SIZE] OF integer;
var
    SuitValues :ARRAY [1..SUIT_CARDS_NUMBER] of integer = (TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE);
    deck : DeckType;
    counter : integer;
<<<<<<< HEAD
    suitIndex : integer;
    cardInSuitIndex : integer;
procedure FillDeck(var theDeck:DeckType);
begin
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

procedure PrintDeck(var theDeck:DeckType);
  var a:integer;
      n:integer;
begin
   for a := 1 to Length(theDeck) do
   begin
   n := theDeck[a];

   case n of
   100:writeln('TWO');
   101:WriteLn('THREE');
   102:WriteLn('FOUR');
   103:WriteLn('FIVE');
   104:WriteLn('SIX');
   105:WriteLn('SEVEN');
   106:WriteLn('EIGHT');
   107:WriteLn('NINE');
   108:WriteLn('TEN');
   109:WriteLn('JACK');
   110:WriteLn('QUEEN');
   111:WriteLn('KING');
   112:WriteLn('ACE');
   end;
end;

end;

begin
  FillDeck(deck);
  PrintDeck(deck);
=======
    idCount : integer;

procedure PrintDeck();
  var a:integer;
begin
   for a := 1 to DECK_SIZE do
      writeln(DECK[a]);
end;

begin
  counter := 1;
  idCount := 1;
  repeat
    DECK[counter] := SuitsValues[idCount];
    idCount := idCount + 1;
    counter := counter + 1;
     if idcount > SUIT_NUMBERS then idCount := 1
  until counter = DECK_SIZE + 1;
  PrintDeck();
>>>>>>> 1028169863bfdad487492ca51e5e4f4e9baeb145
end.
