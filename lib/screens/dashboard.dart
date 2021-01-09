import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwit/screens/login.dart';
import 'package:kwit/screens/rehab.dart';
import 'package:kwit/screens/stress.dart';
import 'package:kwit/screens/anger.dart';
import 'package:kwit/screens/sad1.dart';
import 'package:kwit/screens/triggers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
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

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: DashBoard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Rehab Centers',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _selectedIndex = 0;
        //Navigator.push(context, MyCustomRoute(builder: (context) => MyApp()));
      } else if (index == 1) {
        _selectedIndex = 1;
        Navigator.push(context, MyCustomRoute(builder: (context) => Rehabs()));
      } else {
        _selectedIndex = 2;
        Navigator.push(context, MyCustomRoute(builder: (context) => Trigger()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF235866),
      appBar: AppBar(
        backgroundColor: const Color(0xFF235866),
        title: Text('Kwit: Emotion Relief'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white60,
        backgroundColor: const Color(0xFF235866),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Dashboard"),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: "Rehab Centers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Shock Therapy",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                height: 250,
                width: 400,
                margin: EdgeInsets.only(left: 10),
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
                    margin: EdgeInsets.only(
                        top: 50, left: 10, right: 10, bottom: 10),
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
        )
      ]),
    );
  }
}
