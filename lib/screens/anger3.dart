import 'package:flutter/material.dart';
import '../main.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'anger2.dart';

class Anger3 extends StatefulWidget {
  @override
  _Anger3State createState() => _Anger3State();
}

class _Anger3State extends State<Anger3> {
  File _imageFile;
  final interval = const Duration(seconds: 1);
  CountDownController _controller = CountDownController();

  void _submitData() {
    if (_imageFile == null) {
      return;
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    }
  }

  void initState() {
    super.initState();
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, -0.3),
            colors: [const Color(0xff1e88e5), const Color(0xff9ccc65)],
            tileMode: TileMode.repeated,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blue[600],
                ),
                onPressed: () => goBack(),
                tooltip: "Go to last page",
                iconSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
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
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Text(
                      "Draw your emotions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0.0),
                      child: Text(
                        "Upload an image to the app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.blue[100],
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
                      color: Colors.blue[100],
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 50,
                            ),
                            Text("No image uploaded")
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 5.0),
              child: RaisedButton(
                onPressed: () => _pickImage(),
                padding: EdgeInsets.all(10.0),
                textColor: Colors.black,
                color: Colors.blue[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.blue[50])),
                child: Text(
                  'Upload image',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.lightGreenAccent,
                ),
                onPressed: () => _submitData(),
                tooltip: "Go to next page",
                iconSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
