import 'package:flutter/material.dart';
import 'package:kwit/screens/anger.dart';
import 'package:kwit/main.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kwit/screens/sad2.dart';
import 'package:kwit/screens/stress1.dart';
import 'package:kwit/screens/stress2.dart';
import 'anger1.dart';

class Stress extends StatefulWidget {
  @override
  _StressState createState() => _StressState();
}

class _StressState extends State<Stress> {
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
      backgroundColor: const Color(0xFF3BC3CD),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgstress.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 100),
                  child: new InkWell(
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/cardbg4.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Text(
                                  "Visualize yourself at a beach. Listen to the music and engage in productive activities",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFF),
                              image: DecorationImage(
                                image: AssetImage('assets/cardbg4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 220,
                            width: 520,
                            child: Card(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.008,
                                  right: 30,
                                  left: 30),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/beachbg.jpg',
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFF),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/cardbg4.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                width: 750,
                                child: IconButton(
                                  padding: EdgeInsets.only(top: 35, bottom: 15),
                                  iconSize: 100,
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: const Color(0xFF2D40A4),
                                  ),
                                  onPressed: () {
                                    if (isPlaying) {
                                      advancedPlayer.pause();
                                      setState(() {
                                        isPlaying = false;
                                      });
                                    } else {
                                      audioCache.play('Calm.mp3');
                                      setState(() {
                                        isPlaying = true;
                                      });
                                    }
                                  },
                                ),
                              ))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 10,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.height * 0.03),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      icon: Icon(Icons.keyboard_arrow_left),
                      color: Colors.black,
                      iconSize: sizewidth(buildContext) * 0.13,
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          right: MediaQuery.of(context).size.height * 0.03),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Stress1()));
                        },
                        icon: Icon(Icons.keyboard_arrow_right),
                        color: Colors.black,
                        iconSize: sizewidth(buildContext) * 0.13,
                      )),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
