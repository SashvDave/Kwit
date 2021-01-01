import 'package:flutter/material.dart';
import 'anger2.dart';
import 'anger.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Anger1 extends StatefulWidget {
  @override
  _Anger1State createState() => _Anger1State();
}

class _Anger1State extends State<Anger1> {
  final _textController = TextEditingController();
  CountDownController _controller = CountDownController();
  final interval = const Duration(seconds: 1);

  void initState() {
    super.initState();
  }

  void goBack() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anger()));
  }

  void _submitData() {
    final enteredText = _textController.text;

    if (enteredText.isEmpty) {
      return;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Anger2()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3BC3CD),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg7.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: CircularCountDownTimer(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  duration: 75,
                  fillColor: Colors.white,
                  color: Colors.greenAccent,
                  textStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  isReverse: true,
                  isReverseAnimation: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Think on whether your anger is justified or not and now write what you can do to prevent yourself from being angry in the future.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Image.asset(
                  'assets/peaceful.jpg',
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 0.74,
                  fit: BoxFit.fill,
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    minLines: 5,
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: 'Enter answer here ...',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      //fillColor: Colors.lightBlue[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    controller: _textController,
                  ),
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
                        MediaQuery.of(context).size.height * 0.05),
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
                          MediaQuery.of(context).size.height * 0.05),
                      child: IconButton(
                        onPressed: () => _submitData(),
                        icon: Icon(Icons.keyboard_arrow_right),
                        color: Colors.blue[200],
                        iconSize: MediaQuery.of(context).size.width * 0.13,
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
