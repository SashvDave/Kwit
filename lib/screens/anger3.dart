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

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Draw your emotions. Upload an image to the app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                child: _imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Colors.blue[100],
                          child: SizedBox(
                            child: Image.file(_image),
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 5.0),
                child: RaisedButton(
                  onPressed: () => getImage(),
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
        ),
      ],
    ));
  }
}
