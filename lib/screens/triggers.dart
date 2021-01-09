import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'package:kwit/screens/stress.dart';
import 'package:kwit/screens/stress2.dart';
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
                        "Exercising is a great method of releasing stress & anxiety!",
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
                            title: "Diet Recommendation",
                            press: () => launch(
                                'https://www.ncbi.nlm.nih.gov/books/NBK235267/'),
                          ),
                          CategoryCardv2(
                            title: "Kegel Exercises",
                            press: () => launch(
                                'https://www.mayoclinic.org/healthy-lifestyle/mens-health/in-depth/kegel-exercises-for-men/art-20045074'),
                          ),
                          CategoryCardv2(
                            title: "Meditation",
                            press: () => launch(
                                'https://www.mindful.org/how-to-meditate/'),
                          ),
                          CategoryCardv2(
                            title: "Yoga",
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
