import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:kwit/screens/dashboard.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kwit",
      home: MyApp(),
    );
  }
}
