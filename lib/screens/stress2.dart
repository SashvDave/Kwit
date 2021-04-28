import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/stress1.dart';
import 'anger1.dart';
import 'package:url_launcher/url_launcher.dart';

class Stress2 extends StatefulWidget {
  @override
  _Stress2State createState() => _Stress2State();
}

class _Stress2State extends State<Stress2> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isPlaying = false;

  final _textController = TextEditingController();
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  void goBack() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  void _submitData() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anger1()));
  }

  @override
  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(buildContext).size;
    double sizeheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double sizewidth(BuildContext context) => MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgstress1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.height * 0.39,
                  padding: EdgeInsets.only(top: 70),
                  child: Text(
                    "Try one of the recipes shown below!",
                    style: Theme.of(context)
                        .textTheme
                        // ignore: deprecated_member_use
                        .display1
                        .copyWith(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 220,
                  width: 420,
                  child: Card(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/cardbg1.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: 20,
                            padding:
                                EdgeInsets.only(top: 70, left: 90, right: 110),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => launch(
                                      'https://www.allrecipes.com/recipe/273610/beautiful-summer-fruit-tart/'),
                                  child: Text(
                                    "Summer fruit tart!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 29),
                                  ),
                                ),
                              ],
                            ))),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 220,
                  width: 420,
                  child: Card(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/cardbg2.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: 20,
                            padding:
                                EdgeInsets.only(top: 60, left: 70, right: 20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => launch(
                                      'https://realsimplegood.com/blueberry-basil-smoothie/'),
                                  child: Text(
                                    "Blueberry basil smoothie!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 29),
                                  ),
                                )
                              ],
                            ))),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 220,
                  width: 420,
                  child: Card(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/cardbg1.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: 20,
                            padding:
                                EdgeInsets.only(top: 70, left: 90, right: 110),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => launch(
                                      'https://www.bluediamond.com/recipes/gold-rush-sriracha-almond-cups'),
                                  child: Text(
                                    "Gold rush siracha cups!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 29),
                                  ),
                                )
                              ],
                            ))),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: Positioned(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stress1()));
                          },
                          icon: Icon(Icons.keyboard_arrow_left),
                          color: Colors.black,
                          iconSize: sizewidth(buildContext) * 0.13,
                        ))),
                    Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height * 0.03),
                        child: Positioned(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                          icon: Icon(Icons.keyboard_arrow_right),
                          color: Colors.black,
                          iconSize: sizewidth(buildContext) * 0.13,
                        ))),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
