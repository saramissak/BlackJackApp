import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'playing_card.dart';
import 'package:flutter/material.dart';

class BlackJack extends StatefulWidget {
  @override
  _BlackJackState createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack> {

  @override
  void initState() {
    newCard();
    newCard();
    for(int i =0; i < myCards.length; i++) {
      total += myCards[i].actualVal;
      print(total);
    }
    super.initState();
  }

  void newCardDealer() {
    var num2 = new Random().nextInt(fullDeck.length);  
    dealerCards.add(fullDeck[num2]);
    fullDeck.remove(num2);
  }

  void newCard() {
    var num1 = new Random().nextInt(fullDeck.length);  
    myCards.add(fullDeck[num1]);
    fullDeck.remove(num1);
  }
  bool canTap = true;
  List<PlayingCard> dealerCards = [];
  List<PlayingCard> myCards =[];
  int total =0;
  int dealerTotal =0;
  List <PlayingCard> fullDeck= [
    new PlayingCard('heart', 1, 1), new PlayingCard('heart', 2, 2), new PlayingCard('heart', 3, 3), new PlayingCard('heart', 4, 4), new PlayingCard('heart', 5, 5), new PlayingCard('heart', 6, 6), new PlayingCard('heart', 7, 7), new PlayingCard('heart', 8, 8), new PlayingCard('heart', 9, 9), new PlayingCard('heart', 10, 10), new PlayingCard('heart', 11, 10), new PlayingCard('heart', 12, 10), new PlayingCard('heart', 13, 10), new PlayingCard('club', 1, 1), new PlayingCard('club', 2, 2), new PlayingCard('club', 3, 3), new PlayingCard('club', 4, 4), new PlayingCard('club', 5, 5), new PlayingCard('club', 6, 6), new PlayingCard('club', 7, 7), new PlayingCard('club', 8, 8), new PlayingCard('club', 9, 9), new PlayingCard('club', 10, 10), new PlayingCard('club', 11, 10), new PlayingCard('club', 12, 10), new PlayingCard('club', 13, 10), new PlayingCard('spades', 1, 1), new PlayingCard('spades', 2, 2), new PlayingCard('spades', 3, 3), new PlayingCard('spades', 4, 4), new PlayingCard('spades', 5, 5), new PlayingCard('spades', 6, 6), new PlayingCard('spades', 7, 7), new PlayingCard('spades', 8, 8), new PlayingCard('spades', 9, 9), new PlayingCard('spades', 10, 10), new PlayingCard('spades', 11, 10), new PlayingCard('spades', 12, 10), new PlayingCard('spades', 13, 10), new PlayingCard('diamond', 1, 1), new PlayingCard('diamond', 2,2), new PlayingCard('diamond', 3, 3), new PlayingCard('diamond', 4, 4), new PlayingCard('diamond', 5, 5), new PlayingCard('diamond', 6, 6),new PlayingCard('diamond', 7, 7), new PlayingCard('diamond', 8, 8), new PlayingCard('diamond', 9, 9), new PlayingCard('diamond', 10, 10), new PlayingCard('diamond', 11, 10), new PlayingCard('diamond', 12, 10), new PlayingCard('diamond', 13, 10)
  ];
  bool _play = false;
  int wins =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          _play ? showCards() : hiddenCards(),
          Container(
            alignment: Alignment.bottomCenter,
            child: buildBottomButtons()
          ), 
          Stack(
            children: buildPlayerCards(), 
          ),
          Container(
            child: myWins(),
          ),
          Positioned(
            bottom: 135.0,
            left: MediaQuery.of(context).size.width / 2 - 50.0,
            child: Column(
              children: <Widget>[
                Text("Dealer total: " + dealerTotal.toString()),
                Text(" Total: " + total.toString()),
              ],
            )
          ),

        ],
      ),
    );
  }
  
  void didIWin() {
    if(total <= 21)
    {
      if(total > dealerTotal || dealerTotal > 21)
      {
        wins++;
      }
    }
  }

  Widget myWins(){
    return Row(
      children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 535.0, left: 110.0),
            child: Text('Number of wins: ' + wins.toString())
          ),
      ]
    );
  }

  void returnCards() {
    setState(() {
      if(_play == true){
        for(int i = myCards.length - 1; i >= 0; i--) {
          fullDeck.add(myCards[i]);
          myCards.removeAt(0);
        } 
        total = 0;
        _play = false;
        newCard();
        newCard();

        for(int i =0; i < myCards.length; i++) {
          total += myCards[i].actualVal;
        }
      }
    });
    
  }

  Widget showCards() { 
    return Scaffold( 
    body: Stack(
      children: [
        Column(
          children: <Widget>[
            Wrap(children: buildDealerCards()),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Dealer total: " + dealerTotal.toString()),
            ),
            
          ],
        ),
        
        Center(
          child: GestureDetector(
            onTap: () {
                didIWin();
                returnCards();
                dealerTotal =0;
                setState(() {
                  canTap = true;
                });
                  
              
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[300],
                    offset: Offset(0.0, 7.0),
                    // blurRadius: 5.0
                  ),
                ]
              ),
              height: 80.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              margin: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            ),
          ),
          
        ),
        
      ],
    )
  );
  }

  Widget hiddenCards(){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150.0,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Text("Dealer's Cards"),
              ),
              Container(
                height: 150.0,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Text("Dealer's Cards"),
              ),
              
            ], 
          ),
          
        ],
      ),
      
    ); 
  }
  
  Widget buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          
          onTap: () {
              setState(() {
                newCard();
                buildPlayerCards();
                if(_play == false)
                  total += myCards[myCards.length-1].actualVal;
                if(total >= 21) 
                  _play = true;

              });
            
          },
          child: Container(
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.green[300],
                  offset: Offset(0.0, 7.0),
                ),
              ]
            ),
            height: 80.0,
            width: MediaQuery.of(context).size.width / 2 - 40.0,
            margin: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  'Hit',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
          ),
          
        ),
        GestureDetector(
          onTap: () {
              setState(() {
                _play = true;
              });
          },

          child: Container(
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.green[300],
                  offset: Offset(0.0, 7.0),
                ),
              ]
            ),
            height: 80.0,
            width: MediaQuery.of(context).size.width / 2 - 40.0,
            margin: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  'Stay',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),          ),
        ),
      ],
    );
  }

  List<Widget> buildPlayerCards() {
    List<Widget> cardWidgets = [];
    if(_play == false)
      for(int index = 0; index < myCards.length; index++) {
        cardWidgets.add(
          new Container(
            height: 150.0,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(left: 50.0 + (40.0 * index), top: 350.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Colors.black.withAlpha(50))
            ),          
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                buildSuit(myCards[index].suit),
                Text(switchValue(myCards[index].value)),
                
              ],
            ),
            width: 110.0,
          )
        );
      }  
    return cardWidgets;
  }
  
  String switchValue(int value) {
    switch(value) {
      case 1:
        return 'A';
        break;
      case 11:
        return 'J';
        break;
      case 12:
        return 'Q';
        break;
      case 13:
        return 'K';
        break;
      default:
        return value.toString();
        break;
    }
  }

  Icon buildSuit(String suit) {
    switch(suit) {
      case "heart":
        return Icon(FontAwesomeIcons.heart, size: 12.0,);
        break;
      case "spades":
        return Icon(FontAwesomeIcons.hatWizard, size: 12.0,);
        break;
      case "diamond":
        return Icon(FontAwesomeIcons.jedi, size: 12.0,);
        break;
      case "club":
        return Icon(FontAwesomeIcons.grunt, size: 12.0,);
        break;
      default:
        return Icon(FontAwesomeIcons.bus, size: 12.0,);
        break;
    }
  }

  List<Widget> buildDealerCards() {
    List<Widget> cardWidgets = [];

    
    dealerTotal = 0;
    int i = 0;
    while(dealerTotal < 18 && dealerTotal <= total && dealerTotal != 21){
          newCardDealer();
          dealerTotal += dealerCards[i].actualVal;
          
          i++;
    }

    for(int index = 0; index < dealerCards.length; index++) {
        cardWidgets.add(
          new Container(
            height: 150.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Colors.black.withAlpha(50))
            ),          
            child: Row(
              children: <Widget>[
                buildSuit(dealerCards[index].suit),
                Text(switchValue(dealerCards[index].value)),
              ],
            ),
            width: 110.0,
          ),
        );
        
      }
      dealerCards = [];
  return cardWidgets;
  }
}
