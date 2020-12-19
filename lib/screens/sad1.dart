import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';

import 'package:kwit/screens/anger1.dart';

void ain() {
  runApp(sad1());
}

class sad1 extends StatelessWidget {
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
  void _launchURL(String uri) async {
    String url = ("https://www.maps.apple.com/maps/search/" + uri) + "/";
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Widget> showCard(context) async {
    Timer(Duration(seconds: 1), () {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            Size size = MediaQuery.of(bc).size;
            return Container(
                height: 250,
                width: size.width,
                margin: const EdgeInsets.fromLTRB(0, 650, 0, 0),
                child: Card(
                  elevation: 10,
                  color: Colors.black,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                          child: new Center(
                              child: Icon(Icons.directions_bike_rounded,
                                  color: Colors.white38, size: 65))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 1, 20, 5),
                          child: new Center(
                              child: Text(
                            "Try out this route",
                            style: TextStyle(
                                color: Colors.white38,
                                fontFamily: 'SFMono',
                                fontSize: 13),
                          ))),
                      Container(
                          height: 50,
                          width: size.width * 0.7,
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 5),
                          child: RaisedButton.icon(
                            color: Colors.white38,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Anger1()));
                            },
                            elevation: 10,
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.black87,
                              size: 25,
                            ),
                            splashColor: Colors.black45,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            label: Text(
                              "GO",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontFamily: 'SFMono'),
                            ),
                          ))
                    ],
                  ),
                ));
          });
    });
  }

  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(buildContext).size;
    return Scaffold(
        body: new Stack(
      children: [
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/biking.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.fromLTRB(80, 150, 50, 0),
          child: new Text(
            "Go For A Ride",
            style: TextStyle(
                color: Colors.black, fontSize: 37, fontFamily: ' SFMono'),
          ),
        ),
        new Container(
          margin: const EdgeInsets.fromLTRB(80, 220, 50, 0),
          child: new Text(
            "Cycling releases mind boosting chemicals which will uplift your mood.",
            style: TextStyle(
                color: Colors.black45, fontSize: 21, fontFamily: ' SFMono'),
          ),
        ),
        Container(
            height: 250,
            width: size.width,
            margin: const EdgeInsets.fromLTRB(0, 650, 0, 0),
            child: Card(
              elevation: 10,
              color: Colors.black,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: new Center(
                          child: Icon(Icons.directions_bike_rounded,
                              color: Colors.white38, size: 65))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 5),
                      child: new Center(
                          child: Text(
                        "Try out this route",
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'SFMono',
                            fontSize: 13),
                      ))),
                  Container(
                      height: 50,
                      width: size.width * 0.7,
                      padding: EdgeInsets.fromLTRB(0, 1, 0, 5),
                      child: RaisedButton.icon(
                        color: Colors.white38,
                        onPressed: (){_launchURL('N+Abbott+Ave');}                      },
                        elevation: 10,
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.black87,
                          size: 25,
                        ),
                        splashColor: Colors.black45,
                        padding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          "GO",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontFamily: 'SFMono'),
                        ),
                      ))
                ],
              ),
            ))
      ],
    ));
  }
}
