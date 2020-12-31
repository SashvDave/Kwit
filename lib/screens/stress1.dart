import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'package:kwit/screens/stress.dart';
import 'package:kwit/screens/stress2.dart';
import 'package:kwit/screens/widgets/category_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

class Stress1 extends StatefulWidget {
  @override
  _Stress1State createState() => _Stress1State();
}

class _Stress1State extends State<Stress1> {
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
                          CategoryCard(
                            title: "Diet Recommendation",
                            svgSrc: "assets/icons/hamburger.svg",
                            press: () => launch(
                                'https://www.ncbi.nlm.nih.gov/books/NBK235267/'),
                          ),
                          CategoryCard(
                            title: "Kegel Exercises",
                            svgSrc: "assets/icons/exercise.svg",
                            press: () => launch(
                                'https://www.mayoclinic.org/healthy-lifestyle/mens-health/in-depth/kegel-exercises-for-men/art-20045074'),
                          ),
                          CategoryCard(
                            title: "Meditation",
                            svgSrc: "assets/icons/meditation.svg",
                            press: () => launch(
                                'https://www.mindful.org/how-to-meditate/'),
                          ),
                          CategoryCard(
                            title: "Yoga",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () =>
                                launch('https://www.yogajournal.com/poses/'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.08,
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stress()));
                          },
                          icon: Icon(Icons.keyboard_arrow_left),
                          color: Colors.black,
                          iconSize: sizewidth(buildContext) * 0.13,
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.08,
                              right: MediaQuery.of(context).size.height * 0.03),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Stress2()));
                            },
                            icon: Icon(Icons.keyboard_arrow_right),
                            color: Colors.black,
                            iconSize: sizewidth(buildContext) * 0.13,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
