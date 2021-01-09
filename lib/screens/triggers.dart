import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
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
  @override
  Widget build(BuildContext buildContext) {
    Size size = MediaQuery.of(buildContext).size;
    double sizeheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double sizewidth(BuildContext context) => MediaQuery.of(context).size.width;
    return Scaffold(
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
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Timer())),
                          ),
                          CategoryCardv2(
                            title: "Delay \n your crave",
                            press: () => launch(
                                'https://www.mayoclinic.org/healthy-lifestyle/mens-health/in-depth/kegel-exercises-for-men/art-20045074'),
                          ),
                          CategoryCardv2(
                            title: "Chew on something",
                            press: () => launch(
                                'https://www.mindful.org/how-to-meditate/'),
                          ),
                          CategoryCardv2(
                            title: "Engage in \nsome physical activity",
                            press: () =>
                                launch('https://www.yogajournal.com/poses/'),
                          ),
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
