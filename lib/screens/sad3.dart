import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/sad2.dart';
import 'package:kwit/screens/videogame.dart';
import 'package:maze/maze.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(sad3());
}

class sad3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kwit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: sadScreen(title: "Sadness Screen"),
    );
  }
}

class sadScreen extends StatefulWidget {
  sadScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Main createState() => Main();
}

class Main extends State<sadScreen> {
  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(buildContext).size;
    double sizeheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double sizewidth(BuildContext context) => MediaQuery.of(context).size.width;
    return Scaffold(
        body: new Stack(
      children: [
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/sad3Wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
            height: sizeheight(buildContext) * 0.35,
            width: size.width * 0.9,
            margin: EdgeInsets.fromLTRB(
                sizewidth(buildContext) * 0.1,
                sizeheight(buildContext) * 0.32,
                sizewidth(buildContext) * 0.1,
                0),
            child: new Card(
              color: Colors.white60,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: new Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, sizeheight(buildContext) * 0.04, 0, 0),
                    child: new Center(
                      child: new Text(
                        "Play a Game",
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'SFMono',
                            fontSize: sizewidth(buildContext) * 0.074),
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  sizewidth(buildContext) * 0.06,
                                  sizeheight(buildContext) * 0.02,
                                  sizewidth(buildContext) * 0.06,
                                  0),
                              child: new Center(
                                child: new Text(
                                  "Games help us train our brains to see the world as a series of challenges that can be overcome by working hard. Overcoming challenges can help train your brain to be optimistic and be happy! Try this game:",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontFamily: 'SFMono',
                                      fontSize: sizewidth(buildContext) * 0.04),
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )),
        new Container(
          color: Colors.transparent,
          margin: EdgeInsets.fromLTRB(
              sizewidth(buildContext) * 0.2,
              sizeheight(buildContext) * 0.75,
              sizewidth(buildContext) * 0.2,
              0),
          width: sizewidth(buildContext) * 0.6,
          height: sizeheight(buildContext) * 0.065,
          child: new RaisedButton.icon(
            elevation: 10,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => gameScreen()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            splashColor: Colors.white30,
            color: const Color(0xFFB8ECF0),
            icon: Icon(
              Icons.gamepad_rounded,
              color: Colors.black38,
              size: sizewidth(buildContext) * 0.1,
            ),
            label: Text(
              "PLAY",
              style: TextStyle(
                color: Colors.black38,
                fontSize: sizewidth(buildContext) * 0.06,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(sizewidth(buildContext) * 0.05, 0, 0,
                  sizeheight(buildContext) * 0.05),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => sad2()));
                },
                icon: Icon(Icons.keyboard_arrow_left),
                color: Colors.white54,
                iconSize: sizewidth(buildContext) * 0.13,
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    sizewidth(buildContext) * 0.05,
                    sizeheight(buildContext) * 0.05),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  icon: Icon(Icons.keyboard_arrow_right),
                  color: Colors.white54,
                  iconSize: sizewidth(buildContext) * 0.13,
                )),
          ],
        )
      ],
    ));
  }
}
