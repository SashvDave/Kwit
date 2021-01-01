import 'package:flutter/material.dart';
import 'package:kwit/screens/dashboard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class ShockTherapy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg21.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0,
                      MediaQuery.of(context).size.height * 0.08,
                      0,
                      MediaQuery.of(context).size.height * 0.05),
                  child: Text(
                    "Why should you stop vaping?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.7,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 7),
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    "\nNicotine addiction can make you feel like you can’t go a minute without vaping. Quitting can help you feel more in control of your life.",
                    "\n63% of people that start vaping do not know that vapes contain nicotine, a highly addicting chemical.",
                    "\nE-cigarettes/Vapes have a higher amount of nicotine in them compared to cigarettes leading to addiction almost 3 times faster than cigarettes.",
                    "\nJUULs can deliver higher nicotine intakes 2.7 faster than other e-cigarettes.",
                    "\nSince the U.S. does not have nicotine concentration limits for JUULs they can contain up to 7% nicotine salt concentration.",
                    "\nThe use of e-cigarettes/vapes leads to a 7x higher odds of ever using cigarettes and 8x higher odds of using cigarettes within the next year.",
                    "\nYoung adults are getting addicted to vapes and e-cigarettes with an alarmingly high rate of about 20% of high schoolers having used a e-cigarette before."
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 5.0),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('assets/bg3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              MediaQuery.of(context).size.height * 0.02,
                              MediaQuery.of(context).size.width * 0.01,
                              MediaQuery.of(context).size.height * 0.02),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.86,
                          child: Text(
                            "$i",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.01,
                      MediaQuery.of(context).size.height * 0.03,
                      MediaQuery.of(context).size.width * 0.01,
                      MediaQuery.of(context).size.height * 0.03),
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: RaisedButton(
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.orange[200],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
