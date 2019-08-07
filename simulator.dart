import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Simulator extends StatefulWidget {
  @override
  _SimulatorState createState() => _SimulatorState();
}

class _SimulatorState extends State<Simulator> {
  bool _cardScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _cardScreen ? pickCards() : buildStartPage()
        ],
      ),
    );
  }

  Widget pickCards(){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              _cardScreen = false;
            });
          },
          icon: Icon(FontAwesomeIcons.timesCircle),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('hi')
        ],
      ),
    );
  }
  Widget buildStartPage() {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _cardScreen = true;
                    });
                  },
                  child: Container(
                    height: 150.0,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Text("No card here"),
                  ),
                ),
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
                Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text("No card here"),
                ),
              ],
            ),
          ],
        ),
    );
  }
}