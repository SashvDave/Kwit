import 'package:flutter/material.dart';
import './main.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Anger3 extends StatefulWidget {
  @override
  _Anger3State createState() => _Anger3State();
}

class _Anger3State extends State<Anger3> {
  File _imageFile;

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
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  tooltip: "Go to next page",
                  iconSize: MediaQuery.of(context).size.height * 0.05,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
