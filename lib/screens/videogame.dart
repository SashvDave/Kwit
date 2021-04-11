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
      title: 'Mediquit',
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

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
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
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: sizeheight(buildContext) * 0.15),
          child: Text(
            "Maze",
            style: TextStyle(
                color: Colors.blueGrey[400],
                fontSize: sizewidth(buildContext) * 0.15,
                fontFamily: 'Monospace'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: sizeheight(buildContext) * 0.3, left: 15, right: 15),
          alignment: Alignment.center,
          height: sizeheight(buildContext) * 0.45,
          width: sizeheight(buildContext) * 0.45,
          child: Card(
            color: Colors.white70,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Maze(
                player: MazeItem('assets/runningman.png', ImageType.asset),
                columns: 7,
                rows: 7,
                wallThickness: 4.0,
                wallColor: Colors.blueGrey[500],
                finish: MazeItem('assets/finishflag.png', ImageType.asset),
                onFinish: () => {
                      showDialog(
                        builder: (context) => new Container(
                          child: AlertDialog(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            backgroundColor: Colors.teal[100],
                            title: new Text(
                              "Finish Line Reached!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blueGrey[700]),
                            ),
                            content: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      sizewidth(buildContext) * 0.05,
                                      sizeheight(buildContext) * 0.01,
                                      0,
                                      0),
                                  child: TextButton(
                                    child: Text(
                                      "play again",
                                      style: TextStyle(
                                          color: const Color(0xFF235866)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      Navigator.push(
                                          context,
                                          MyCustomRoute(
                                              builder: (buildContext) =>
                                                  gameScreen()));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      sizeheight(buildContext) * 0.01,
                                      sizewidth(buildContext) * 0.05,
                                      0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13.0)),
                                    color: Colors.blueGrey[200],
                                    child: Text("I'm Done",
                                        style: TextStyle(
                                          color: Colors.white70,
                                        )),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      Navigator.push(
                                          buildContext,
                                          MaterialPageRoute(
                                              builder: (buildContext) =>
                                                  MyApp()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: false,
                        context: buildContext,
                      )
                    }),
          ),
        ),
        Container(
          width: sizewidth(buildContext) * 0.8,
          height: sizeheight(buildContext) * 0.06,
          margin: EdgeInsets.fromLTRB(sizewidth(buildContext) * 0.1,
              sizeheight(buildContext) * 0.8, sizewidth(buildContext) * 0.1, 0),
          child: RaisedButton(
            color: const Color(0xFFB8ECF0),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            child: Text("Skip",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: sizewidth(buildContext) * 0.06)),
            onPressed: () {
              Navigator.push(buildContext,
                  MaterialPageRoute(builder: (buildContext) => MyApp()));
            },
          ),
        )
      ],
    ));
  }
}
