import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/sad2.dart';
import 'package:maze/maze.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(gameScreen());
}

class gameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kwit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: game(title: "Video Game Screen"),
    );
  }
}

class game extends StatefulWidget {
  game({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Main createState() => Main();
}

class Main extends State<game> {
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
              image: new AssetImage("assets/videogameWallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Maze(
            player: MazeItem('assets/ecigarette.png', ImageType.asset),
            columns: 6,
            rows: 8,
            wallThickness: 4.0,
            wallColor: Colors.white24,
            finish: MazeItem('assets/trashcan.png', ImageType.asset),
            onFinish: () => {
                  showDialog(
                    barrierDismissible: false,
                    context: buildContext,
                    child: new Container(
                      child: AlertDialog(
                        backgroundColor: Colors.blue[200],
                        title: new Text("Finish Line Reached!"),
                        content: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  sizewidth(buildContext) * 0.05,
                                  sizeheight(buildContext) * 0.05,
                                  0,
                                  0),
                              child: TextButton(
                                child: Text("play again"),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (buildContext) =>
                                              gameScreen()));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0,
                                  sizeheight(buildContext) * 0.05,
                                  sizewidth(buildContext) * 0.05,
                                  0),
                              child: TextButton(
                                child: Text("I'm Done"),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.push(
                                      buildContext,
                                      MaterialPageRoute(
                                          builder: (buildContext) => MyApp()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                }),
      ],
    ));
  }
}
