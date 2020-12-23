import 'dart:async';
import 'dart:ui';
import 'dart:io';
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
    return Scaffold(
        body: new Stack(
      children: [
        Maze(
            player: MazeItem('assets/ecigarette.png', ImageType.asset),
            columns: 6,
            rows: 8,
            wallThickness: 4.0,
            wallColor: Colors.teal[400],
            finish: MazeItem('assets/trashcan.png', ImageType.asset),
            onFinish: () => {
                  showDialog(
                      context: buildContext,
                      child: new Container(
                        child: AlertDialog(
                          backgroundColor: Colors.teal[300],
                          title: new Text("Finish Line Reached!"),
                          content: new Text("Want to play again?"),
                        ),
                      ))
                }),
      ],
    ));
  }
}
