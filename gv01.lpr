program testing;

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
    shuffletime = 10000;
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
    for curIndex := 0 to Length(theDeck) do
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
    temp1 := Length(theDeck);
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
    for counter := 0 to Length(theDeck) do
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
    WRITELN('ПЕРВОНАЧАЛЬНЫЙ ПАЗМЕР РУКИ!!!', size);
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
    Writeln(Name: 30, ' CARDS IS  ');
    for temp1 := 0 to Length(theHand) - 1 do
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
    temp: integer;
    summ: integer;
  begin
    score := 0;
    temp := 0;
    for counter := 0 to Length(theHand) do
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
  begin
    Answer := 'Would you like to take another card? Type Y or N';
    Ask(Answer);
    HandCheck(Player);
    repeat
      DealCards(Player);
      PrintHand(Player, Name);
      writeln(GetHandScore(Player));
    until Ask(Answer) = False or HandCheck(Player) = False;

  end;

  procedure GetWinner(var playhand: HandType; var dealhand: HandType);
  var
    playerscore: integer;
    dealerscore: integer;
  begin
    playerscore := GetHandScore(playhand);
    dealerscore := GetHandScore(dealhand);
    if playerscore > dealerscore then
      writeln('You WIN!!! With -  ', playerscore, 'scores      ',
        'Dealerscore is  ', dealerscore)
    else if playerscore = dealerscore then
      writeln('NO winner you score is  ', playerscore, '   Dealerscore is   ',
        dealerscore)
    else
      writeln('You loose with    ', playerscore, '    Dealer score is   ', dealerscore);
  end;



begin
  Answer := '';
  Name := 'Ali';
  Score := 0;
  Score2 := 0;
  FillDeck(deck);
  ShuffleDeck(deck);
  DealCards(Player);
  DealCards(Dealer);
  DealCards(Player);
  DealCards(Player);
  DealCards(Dealer);
  PrintHand(Player, Name);
  writeln('this is proc out scor  ', GetHandScore(Player));
  Score := GetHandScore(Player);
  Writeln('THIS IS SCORE PROCEDURE     ', Score);
  HandCheck(Player);
  HandCheck(Dealer);
  GetWinner(Player, Dealer);
  Score2 := GetHandScore(Dealer);
  writeln('DEALERS ', Score2);
  Name := 'not ali!!';
  PrintHand(Dealer, Name);



end.
