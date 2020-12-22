import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'anger1.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Anger extends StatefulWidget {
  @override
  _AngerState createState() => _AngerState();
}

class _AngerState extends State<Anger> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isPlaying = false;

  @override
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFDBEDFF),
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.1, 0, 0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Start your music below for this therapy!"),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.asset(
                  'assets/sunset.png',
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 100,
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.red[400],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => goBack(),
                      tooltip: "Go to last page",
                      iconSize: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => _submitData(),
                      tooltip: "Go to next page",
                      iconSize: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
