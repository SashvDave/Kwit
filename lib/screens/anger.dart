import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kwit/screens/dashboard.dart';
import 'anger1.dart';

class Anger extends StatefulWidget {
  @override
  _AngerState createState() => _AngerState();
}

class _AngerState extends State<Anger> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg6.png'), fit: BoxFit.cover)),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Transform.scale(
                  scale: 2.5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[100], shape: BoxShape.circle),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.15,
                              0,
                              MediaQuery.of(context).size.height * 0.015),
                          child: Text(
                            "Play the music to start your therapy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 7),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Image.asset(
                            'assets/sunset.jpg',
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.37,
                            fit: BoxFit.fill,
                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                        Container(
                          child: Container(
                            width: 750,
                            child: IconButton(
                              padding: EdgeInsets.only(top: 15, bottom: 10),
                              iconSize: 30,
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: const Color(0xFF1976D2),
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    0,
                    MediaQuery.of(context).size.height * 0.15),
                child: IconButton(
                  onPressed: () => goBack(),
                  icon: Icon(Icons.keyboard_arrow_left),
                  color: Colors.blue[200],
                  iconSize: MediaQuery.of(context).size.width * 0.13,
                ),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Anger1()));
                    },
                    icon: Icon(Icons.keyboard_arrow_right),
                    color: Colors.blue[200],
                    iconSize: MediaQuery.of(context).size.width * 0.13,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
