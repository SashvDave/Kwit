import 'package:flutter/material.dart';
import './main.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'anger2.dart';

class Anger3 extends StatefulWidget {
  @override
  _Anger3State createState() => _Anger3State();
}

class _Anger3State extends State<Anger3> {
  File _imageFile;
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 73;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
        }
      });
    });
  }

  void _submitData() {
    if (timerText != "00: 00" || _imageFile == null) {
      return;
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    }
  }

  void initState() {
    super.initState();
    startTimeout();
  }

  void goBack() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anger2()));
  }

  Future<void> _pickImage() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFDBEDFF),
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height * 0.1, 0, 0),
        height: MediaQuery.of(context).size.height,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          color: Colors.red[100],
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.timer),
                  SizedBox(
                    width: 5,
                  ),
                  Text(timerText)
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 35.0),
                child: Text(
                    "Draw your emotions on a piece of paper and upload it to the app."),
              ),
              _imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        color: Colors.red[400],
                        child: SizedBox(
                          child: Image.file(_imageFile),
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        color: Colors.red[400],
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 25.0),
                child: RaisedButton(
                  onPressed: () => _pickImage(),
                  padding: EdgeInsets.all(10.0),
                  textColor: Colors.white,
                  color: Colors.red[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)),
                  child: Text(
                    'Upload image',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
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
