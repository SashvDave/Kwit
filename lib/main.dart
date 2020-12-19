import 'package:flutter/material.dart';
import 'package:kwit/screens/stress.dart';
import 'package:kwit/screens/anger.dart';
import 'package:kwit/screens/sad1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF235866),
      appBar: AppBar(
        title: Text('Kwit: Emotion Relief Exercises'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Anger()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              height: 250,
              width: 400,
              margin: EdgeInsets.only(left: 10),
              child: Card(
                  margin:
                      EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: new InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Anger()));
                      },
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ListTile(
                            title: new Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Anger exercises   😡 → 😁",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: new Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Our ultimate goal from your participating in these exercises is not to forget about, but to understand your anger and come over it. Work through and participate in these exercises to the best of your ability. ",
                                style: TextStyle(
                                  color: const Color(0xFF242525),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]))),
            ),
            new Container(
              alignment: Alignment.center,
              height: 250,
              width: 400,
              margin: EdgeInsets.only(left: 13.25),
              child: Card(
                  margin:
                      EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: new InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sad1()));
                      },
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ListTile(
                            title: new Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Sadness exercises   😔 → 😁",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: new Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "From participating in these exercises, our intentions are to uplift your mood. Thes exercises encompass audio, visual, and mental therapies so be sure to engage with the program! ",
                                style: TextStyle(
                                  color: const Color(0xFF242525),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]))),
            ),
            new Container(
              alignment: Alignment.center,
              height: 250,
              width: 400,
              margin: EdgeInsets.only(left: 13.25),
              child: new InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Stress()));
                  },
                  child: Card(
                      margin: EdgeInsets.only(
                          top: 50, left: 10, right: 10, bottom: 10),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stress()));
                          },
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: ListTile(
                                title: new Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Stress exercises   😰 → 😁",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                subtitle: new Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "If you're feeling stressed or experiencing anxiety, kwit is here for you! Working hand in hand with these therapies will allow you to relieve your stress in some extent and we hope you feel better after participating!",
                                    style: TextStyle(
                                      color: const Color(0xFF242525),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])))),
            ),
          ],
        ),
      ),
    );
  }
}
