import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/login.dart';
import 'package:kwit/screens/rehab.dart';
import 'package:kwit/screens/stress.dart';
import 'package:kwit/screens/stress2.dart';
import 'package:kwit/screens/timer.dart';
import 'package:kwit/screens/widgets/category_card.dart';
import 'package:kwit/screens/widgets/category_cardv2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

class Trigger extends StatefulWidget {
  @override
  _TriggerState createState() => _TriggerState();
}

class _TriggerState extends State<Trigger> {
  int _selectedIndex = 2;
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      } else if (index == 1) {
        _selectedIndex = 1;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Rehabs()));
      } else {
        _selectedIndex = 2;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Trigger()));
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(buildContext).size;
    double sizeheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double sizewidth(BuildContext context) => MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        backgroundColor: const Color(0xFFFFDC88),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Dashboard"),
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgstress1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                        "Feeling a crave? Try partaking in some of the activities below!",
                        style: Theme.of(context)
                            .textTheme
                            // ignore: deprecated_member_use
                            .display1
                            .copyWith(color: Colors.black)),
                  ),
                  Container(
                    child: Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.only(top: 40),
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCardv2(
                              title: "Nicotine Replacement Therapy",
                              press: () => launch(
                                  "https://smokefree.gov/tools-tips/how-to-quit/using-nicotine-replacement-therapy")),
                          CategoryCardv2(
                            title: "Delay \n your crave",
                            press: () => launch(
                                'https://www.mayoclinic.org/healthy-lifestyle/quit-smoking/in-depth/nicotine-craving/art-20045454'),
                          ),
                          CategoryCardv2(
                            title: "Chew on something",
                            press: () => launch(
                                'https://teazaenergy.com/blogs/resources-to-quit-tobacco/chewing-tobacco-alternatives'),
                          ),
                          CategoryCardv2(
                              title: "Engage in \nsome physical activity",
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Timer()))),
                          CategoryCardv2(
                            title: "Call a friend",
                            press: () =>
                                launch('https://www.yogajournal.com/poses/'),
                          ),
                          CategoryCardv2(
                            title: "Call a helpline",
                            press: () =>
                                launch('https://www.yogajournal.com/poses/'),
                          ),
                          CategoryCardv2(
                            title:
                                "Write down to remember the benefits of resisting",
                            press: () =>
                                launch('https://www.yogajournal.com/poses/'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
