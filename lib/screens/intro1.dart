import 'package:flutter/material.dart';
import 'package:kwit/screens/intro2.dart';

class Intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/intro1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 730.0, bottom: 20),
                  child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Intro2()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      label: Text('I am ready to move on!',
                          style: TextStyle(color: Colors.black, fontSize: 17)),
                      icon: Icon(Icons.train_outlined, color: Colors.black),
                      padding: const EdgeInsets.all(13.0),
                      splashColor: Colors.lightBlue[200],
                      color: const Color(0xFFABF6D4)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}