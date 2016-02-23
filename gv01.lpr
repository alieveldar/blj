program testing;

uses
  Crt;

label
  start;

const
  SUIT_CARDS_NUMBER = 13;
  SUITS_NUMBER = 4;
  DECK_SIZE = SUIT_CARDS_NUMBER * SUITS_NUMBER;

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
type
  DeckType = array of integer;
  HandType = array of integer;
var
  SuitValues: array [1..SUIT_CARDS_NUMBER] of
  integer = (TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN,
    JACK, QUEEN, KING, ACE);
  deck: DeckType;
  Dealer: HandType;
  Player: HandType;
  counter: integer;
  suitIndex: integer;
  cardInSuitIndex: integer;
  hand: integer;
  Name: string;
  Answer: string;
  TEMP: integer;
  Score: integer;
  Score2: integer;

  procedure ShuffleDeck(var theDeck: DeckType);
  const
    shuffletime = 15510;
  var
    shufflecount1: integer;
    shufflecount2: integer;
    temp1: integer;
    temp2: integer;
    counter: integer;
  begin
    Randomize;
    for counter := 0 to shuffletime do
    begin

      shufflecount1 := Random(Length(theDeck));
      shufflecount2 := Random(Length(theDeck));
      temp1 := theDeck[shufflecount1];
      temp2 := theDeck[shufflecount2];
      theDeck[shufflecount1] := temp2;
      theDeck[shufflecount2] := temp1;
    end;

  end;

  procedure FillDeck(var theDeck: DeckType);

  begin
    cardInSuitIndex := 0;
    SetLength(theDeck, DECK_SIZE);
    counter := 0;
    for suitIndex := 1 to SUITS_NUMBER do
    begin
      for cardInSuitIndex := 1 to Length(SuitValues) do
      begin
        deck[counter] := SuitValues[cardInSuitIndex];
        counter := counter + 1;
      end;
    end;
  end;

  procedure PrintCArd(card: integer);
  var
    n: integer;
  begin
    n := card;
    case n of
      100: writeln('TWO');
      101: Writeln('THREE');
      102: Writeln('FOUR');
      103: Writeln('FIVE');
      104: Writeln('SIX');
      105: Writeln('SEVEN');
      106: Writeln('EIGHT');
      107: Writeln('NINE');
      108: Writeln('TEN');
      109: Writeln('JACK');
      110: Writeln('QUEEN');
      111: Writeln('KING');
      112: Writeln('ACE');
    end;
  end;

  procedure PrintDeck(var theDeck: DeckType);
  var
    curIndex: integer;
    arrelement: integer;
  begin
    for curIndex := 0 to (Length(theDeck) - 1) do
    begin
      arrelement := theDeck[curIndex];
      PrintCard(arrelement);
    end;
  end;

  function PassCard(var theDeck: DeckType): integer;
  var
    temp1: integer;
    temp2: integer;
  begin
    temp1 := (Length(theDeck) - 1);
    temp2 := theDeck[temp1];
    theDeck[temp1] := 0;
    temp1 := temp1 - 1;
    Setlength(theDeck, temp1);
    PassCard := temp2;

  end;


  procedure CheckDeck(var theDeck: DeckType);
  var
    counter: integer;
    arrelement: integer;
    c: integer;
  begin
    c := 0;
    writeln('Deck size is  ', Length(theDeck));
    for counter := 0 to (Length(theDeck) - 1) do
    begin
      arrelement := theDeck[counter];
      case arrelement of
        100: c := c + 1;
      end;
    end;
    Writeln(c);
  end;

  procedure DealCards(var theHand: HandType);
  var
    size, newSize, curIndex: integer;

  begin
    size := Length(theHand);
    curIndex := size;
    newSize := size + 1;
    SetLength(theHand, newSize);
    theHand[curIndex] := PassCard(deck);

  end;

  procedure PrintHand(var theHand: HandType; var Name: string);
  var
    temp1: integer = 0;
    temp2: integer = 0;
  begin
    writeln('==========');
    for temp1 := 0 to (Length(theHand) - 1) do
    begin
      temp2 := theHand[temp1];
      PrintCard(temp2);
    end;
    writeln('==========');
  end;

  function Ask(var str: string): boolean;
  var
    answer: string;
  begin
    writeln(str);
    Readln(answer);
    Ask := False;
    case answer of
      'Y': Ask := True;
      'y': Ask := True;
    end;
  end;

  function GetCardScore(var card: integer): integer;
  begin
    case card of
      100: GetCardScore := 2;
      101: GetCardScore := 3;
      102: GetCardScore := 4;
      103: GetCardScore := 5;
      104: GetCardScore := 6;
      105: GetCardscore := 7;
      106: GetCardScore := 8;
      107: GetCardScore := 9;
      108: GetCardScore := 10;
      109: GetCardScore := 10;
      110: GetCardScore := 10;
      111: GetCardScore := 10;
      112: GetCardScore := 11;
    end;
  end;

  function GetHandScore(var theHand: HandType): integer;
  var
    counter: integer;
    score: integer;
  begin
    score := 0;
    temp := 0;
    for counter := 0 to (Length(theHand) - 1) do
    begin
      score := GetCardScore(theHand[counter]) + score;

    end;
    GetHandScore := score;
    score := 0;

  end;

  function HandCheck(var theHand: HandType): boolean;
  var
    counter: integer;
    score: integer;

  begin
    for counter := 0 to Length(theHand) do
      score := GetHandScore(theHand);
    if score <= 21 then
      HandCheck := True
    else
      HandCheck := False;
  end;

  procedure PlayerSelection();
  var
    choice: boolean;
    check: boolean;
  begin
    Answer := '***********Would you like to take another card? Type Y or N***********';
    choice := Ask(Answer);
    check := HandCheck(Player);
    if choice = True then
    begin
      DealCards(Player);
      PrintHand(Player, Name);
      writeln(GetHandScore(Player));
      PlayerSelection();
    end;
  end;

  procedure GetWinner(var playhand: HandType; var dealhand: HandType);
  var
    playerscore: integer;
    dealerscore: integer;
    playerstatus: boolean;
    dealerstatus: boolean;
  begin
    playerstatus := HandCheck(playhand);
    dealerstatus := HandCheck(dealhand);
    playerscore := GetHandScore(playhand);
    dealerscore := GetHandScore(dealhand);
    writeln('***********Player score is     (', playerscore, ')***********');
    WriteLn('***********Dealer score is     (', dealerscore, ')***********');

    if playerstatus > dealerstatus then
      writeln('***********You Win!***********');
    if playerstatus < dealerstatus then
      writeln('***********Dealer Win***********');
    if playerstatus = dealerstatus then
    begin
      if playerstatus = False then
        writeln('***********Nobody Win!!!***********')
      else if playerscore > dealerscore then
        writeln('***********You WIN!!***********')
      else if playerscore = dealerscore then
        writeln('***********Nobody WIN!!***********')
      else
        writeln('***********Dealer WIN!!***********');
    end;

  end;

  procedure DealerTakesCards();
  begin
    if GetHandScore(Dealer) < 17 then
    begin
      DealCards(Dealer);
      DealerTakesCards();
    end;
  end;

begin
  ClrScr;
  Name := 'Player';
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('==================== Hello Welcome to BlackJack game ====================');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  Delay(1500);
  start:
    SetLength(Player, 0);
  SetLength(Dealer, 0);
  ClrScr;
  FillDeck(deck);
  ShuffleDeck(deck);
  DealCards(Player);
  DealCards(Player);
  DealCards(Dealer);
  DealCards(Dealer);
  delay(1500);
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  writeln('********Now the cards are dealt********');
  Delay(1200);
  writeln('**** This is you card and scores****');
  delay(1000);
  PrintHand(Player, Name);
  Delay(1000);
  WriteLn('');
  WriteLn('');
  WriteLn('');
  WriteLn('');
  writeln('You score is  (', GetHandScore(Player), ')');
  PlayerSelection();
  delay(1200);
  ClrScr;
  WriteLn('');
  WriteLn('');
  WriteLn('');
  WriteLn('');
  DealerTakesCards();
  Name := 'Dealer';
  WriteLn('This Is Dealer hand');
  PrintHand(Dealer, Name);
  GetWinner(Player, Dealer);
  delay(1500);
  writeln('');
  writeln('');
  writeln('');
  writeln('');
  Answer := '###############_______Would you like to try again? (Y or N)_______##############';
  if Ask(answer) = True then
    goto  start;

end.
