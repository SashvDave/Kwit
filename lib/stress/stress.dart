import 'package:flutter/material.dart';
import 'package:kwit/anger/anger.dart';
import 'package:kwit/main.dart';

class Stress extends StatefulWidget {
  @override
  _StressState createState() => _StressState();
}

class _StressState extends State<Stress> {
  final _textController = TextEditingController();
  void _submitData() {
    final enteredText = _textController.text;

    if (enteredText.isEmpty) {
      return;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3BC3CD),
      appBar: AppBar(
        title: Text('Kwit: Stress Relief Exercise'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Anger()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFF),
          image: DecorationImage(
            image: AssetImage('assets/stressbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
                height: 600,
                width: 355,
                margin: EdgeInsets.only(left: 17, top: 50),
                child: new InkWell(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/happy.png"),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 20, left: 15, right: 15),
                          child: Text(
                            "Visualize yourself at a beach. Listen to the music and engage in productive activities",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        )),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                )),
            new Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              width: 400,
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Text('See Report',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                padding: const EdgeInsets.all(13.0),
                splashColor: Colors.lightBlue[200],
                color: const Color(0xFFB8ECF0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
