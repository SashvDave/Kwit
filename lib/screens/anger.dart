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
      backgroundColor: const Color(0xFF3BC3CD),
      appBar: AppBar(
        title: Text('Kwit: Anger relief'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg6.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Transform.scale(
                  scale: 2.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/sunset.png',
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.37,
                          ),
                        ),
                        Container(
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.98,
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () => _submitData(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Text('Next',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                padding: const EdgeInsets.all(13.0),
                splashColor: Colors.lightBlue[200],
                color: const Color(0xFFB8ECF0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
