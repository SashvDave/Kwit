import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/triggers.dart';
import 'shockTherapy.dart';
import 'login.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'dart:io' show Platform;

void main() {
  runApp(Rehabs());
}

class Rehabs extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: clinics(title: 'Flutter Demo Home Page'),
    );
  }
}

class clinics extends StatefulWidget {
  clinics({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

class _MyHomePageState extends State<clinics> {
  @override
  void initState() {
    super.initState();
  }

  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
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
        Navigator.push(context, MyCustomRoute(builder: (context) => MyApp()));
      } else if (index == 1) {
        _selectedIndex = 1;
        Navigator.push(context, MyCustomRoute(builder: (context) => Rehabs()));
      } else {
        _selectedIndex = 2;
        Navigator.push(context, MyCustomRoute(builder: (context) => Trigger()));
      }
    });
  }

  void _launchURL(String uri_android, String uri_ios) async {
    String url = "";
    if (Platform.isIOS) {
      url = ("https://maps.apple.com/?address=" + uri_ios) + "/";
    } else {
      url = ("https://www.google.com/maps/search/" + uri_android) + "/";
    }
    print(url);
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double sizewidth(BuildContext context) => MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFF235866),
          title: Text('Mediquit: Emotion Relief'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => login())));
                    },
                    child: Icon(Icons.portrait_rounded)))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.white60,
          backgroundColor: const Color(0xFF235866),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: "Dashboard"),
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: "Rehab Centers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: "Trigger Prevention",
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
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: new Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 35, left: 40, right: 40, bottom: 40),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Rehabilitation Centers",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                      Container(
                        height: sizeheight(context) * 0.2,
                        width: sizewidth(context) * 1,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shadowColor: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image:
                                            AssetImage('assets/location1.png'),
                                        height: 110,
                                        width: 110),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 32, top: 20),
                                    child: Text(
                                      "Valley House Center",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                          Text(
                                            "(408) 988 7667",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        UrlLauncher.launch("tel://4089887667");
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(right: 38, top: 10),
                                    child: RaisedButton.icon(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: Colors.teal[100],
                                        icon: Icon(Icons.near_me,
                                            color: Colors.black45),
                                        label: Text(
                                          "Get Directions",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        onPressed: () {
                                          _launchURL("991+Clyde+Ave",
                                              "991%20Clyde%20Ave");
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: sizeheight(context) * 0.2,
                        width: sizewidth(context) * 1,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shadowColor: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image:
                                            AssetImage('assets/location4.png'),
                                        height: 110,
                                        width: 110),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 32, top: 20),
                                    child: Text(
                                      "Cal. Department Rehab",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                          Text(
                                            "(408) 254 5750",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        UrlLauncher.launch("tel://4082545750");
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(right: 38, top: 10),
                                    child: RaisedButton.icon(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: Colors.teal[100],
                                        icon: Icon(Icons.near_me,
                                            color: Colors.black45),
                                        label: Text(
                                          "Get Directions",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        onPressed: () {
                                          _launchURL("2160+Lundy+Ave",
                                              "2160%20Lundy%20Ave");
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: sizeheight(context) * 0.2,
                        width: sizewidth(context) * 1,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shadowColor: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image:
                                            AssetImage('assets/location5.png'),
                                        height: 110,
                                        width: 110),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 55, top: 20),
                                    child: Text(
                                      "Wellness Retreat",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                          Text(
                                            "(408) 539 6575",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        UrlLauncher.launch("tel://4085396575");
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(right: 38, top: 10),
                                    child: RaisedButton.icon(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: Colors.teal[100],
                                        icon: Icon(Icons.near_me,
                                            color: Colors.black45),
                                        label: Text(
                                          "Get Directions",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        onPressed: () {
                                          _launchURL("10615+Crothers+Rd",
                                              "10615%20Crothers%20Rd");
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: sizeheight(context) * 0.2,
                        width: sizewidth(context) * 1,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shadowColor: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image:
                                            AssetImage('assets/location2.png'),
                                        height: 110,
                                        width: 110),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 42, top: 20),
                                    child: Text(
                                      "Restorative Rehab.",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                          Text(
                                            "(833) 600 0622",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        UrlLauncher.launch("tel://8336000622");
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(right: 38, top: 10),
                                    child: RaisedButton.icon(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: Colors.teal[100],
                                        icon: Icon(Icons.near_me,
                                            color: Colors.black45),
                                        label: Text(
                                          "Get Directions",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        onPressed: () {
                                          _launchURL("E+San+Fernando+St",
                                              "E%20San%20Fernando%20St");
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: sizeheight(context) * 0.2,
                        width: sizewidth(context) * 1.2,
                        padding: EdgeInsets.only(left: 10, right: 20),
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shadowColor: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image:
                                            AssetImage('assets/location3.png'),
                                        height: 110,
                                        width: 110),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 32, top: 20),
                                    child: Text(
                                      "Windsor Park Care",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 50, top: 10),
                                    child: GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.black87,
                                          ),
                                          Text(
                                            "(510) 7937 222",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        UrlLauncher.launch("tel://5107937222");
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(right: 28, top: 10),
                                    child: RaisedButton.icon(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        color: Colors.teal[100],
                                        icon: Icon(Icons.near_me,
                                            color: Colors.black45),
                                        label: Text(
                                          "Get Directions",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        onPressed: () {
                                          _launchURL("2400+Parkside+Dr",
                                              "2400%20Parkside%20Dr");
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ))
        ]));
  }
}
