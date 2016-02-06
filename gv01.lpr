program v01;
const SUIT_CARDS_NUMBER = 13;
      SUITS_NUMBER      = 4;
      DECK_SIZE         = SUIT_CARDS_NUMBER * SUITS_NUMBER;
 
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

	DeckType = ARRAY [1..DECK_SIZE] OF integer;
var
    SuitValues :ARRAY [1..SUIT_CARDS_NUMBER] of integer = (TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE);
    deck : DeckType;
    counter : integer;
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
   WriteLn(n);
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
end.
