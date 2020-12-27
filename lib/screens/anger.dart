import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
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
      body: Stack(children: <Widget>[
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
              Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 10),
                  child: new InkWell(
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/happy.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Text(
                                  "Play the music to start your therapy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFF),
                              image: DecorationImage(
                                image: AssetImage('assets/happy.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 220,
                            width: 520,
                            child: Card(
                              margin: EdgeInsets.only(right: 30, left: 30),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/sunset.png',
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
                                    'assets/happy.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                width: 750,
                                child: IconButton(
                                  padding: EdgeInsets.only(top: 25, bottom: 15),
                                  iconSize: 100,
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: const Color(0xFF4FCB79),
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
              new Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: 400,
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
            ],
          ),
        )
      ]),
    );
  }
}
