import 'dart:async';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(sad2());
}

class sad2 extends StatelessWidget {
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
        backgroundColor: Colors.lightBlue,
        body: new Stack(
          children: [],
        ));
  }
}
