import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kwit/screens/dashboard.dart';
import 'anger1.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3BC3CD),
      appBar: AppBar(
        title: Text('Kwit: Stress Relief Exercise'),
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
              image: AssetImage('assets/bgstress1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.height * 0.39,
                padding: EdgeInsets.only(top: 50),
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
                              EdgeInsets.only(top: 50, left: 90, right: 110),
                          child: Column(
                            children: [
                              Text(
                                "Try cooking a summer fruit tart!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 29),
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
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "Try cooking some {}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
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
                          image: AssetImage("assets/cardbg1.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Text(
                          "Try cooking some {}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
