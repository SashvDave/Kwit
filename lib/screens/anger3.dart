import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:kwit/screens/dashboard.dart';
import 'anger1.dart';
import 'anger2.dart';
import 'dart:async';
import 'dart:io';

class Anger3 extends StatefulWidget {
  @override
  _Anger3State createState() => _Anger3State();
}

class _Anger3State extends State<Anger3> {
  File _imageFile;
  CountDownController _controller = CountDownController();
  final interval = const Duration(seconds: 1);

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
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/bg9.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
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
                      "Draw your emotions. Upload an image to the app.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
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
                      splashColor: Colors.lightBlue[200],
                      color: const Color(0xFFB8ECF0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.blue[50])),
                      child: Text(
                        'Upload image',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01),
                    width: MediaQuery.of(context).size.width * 0.98,
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () => _submitData(),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
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
          ],
        ));
  }
}
