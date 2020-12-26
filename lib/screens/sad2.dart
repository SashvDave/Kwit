import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kwit/screens/sad1.dart';
import 'package:kwit/screens/sad3.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

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
              image: new AssetImage("assets/sad2Wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
            height: sizeheight(buildContext) * 0.65,
            width: size.width,
            margin: EdgeInsets.fromLTRB(
                sizewidth(buildContext) * 0.02,
                sizeheight(buildContext) * 0.22,
                sizewidth(buildContext) * 0.02,
                0),
            child: new Card(
              color: Colors.white60,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: new Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          10, sizeheight(buildContext) * 0.02, 10, 0),
                      child: new Text(
                        "Read a Comic Book",
                        style: TextStyle(
                            fontFamily: 'SFMono',
                            fontSize: sizewidth(buildContext) * 0.08,
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          50, sizeheight(buildContext) * 0.006, 50, 0),
                      child: new Text(
                        "Reading a funny short story will help uplift your mood! Try this comic:",
                        style: TextStyle(
                            fontFamily: 'SFMono',
                            fontSize: sizewidth(buildContext) * 0.04,
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      child: new Stack(
                    children: [
                      Container(
                        child: PDF.assets(
                          'assets/comicbook.pdf',
                          height: sizeheight(buildContext) * 0.4,
                          width: sizewidth(buildContext) * 0.85,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )),
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
                      context, MaterialPageRoute(builder: (context) => sad1()));
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
                        MaterialPageRoute(builder: (context) => sad3()));
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
