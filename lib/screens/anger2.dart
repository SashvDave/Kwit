import 'package:flutter/material.dart';
import 'anger3.dart';
import 'anger1.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Anger2 extends StatefulWidget {
  @override
  _Anger2State createState() => _Anger2State();
}

class _Anger2State extends State<Anger2> {
  final _textController = TextEditingController();
  CountDownController _controller = CountDownController();
  final interval = const Duration(seconds: 1);

  void initState() {
    super.initState();
  }

  void goBack() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anger1()));
  }

  void _submitData() {
    final enteredText = _textController.text;

    if (enteredText.isEmpty) {
      return;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Anger3()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kwit: Anger Relief'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Anger1()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/bg8.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularCountDownTimer(
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Write down all the people of things that make you angry and why. Try to adhere to the time as much as possible.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/waterdrop.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    minLines: 5,
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: 'Enter answer here ...',
                      filled: true,
                      //fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: _textController,
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(left: 10),
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
        ),
      ),
    );
  }
}
