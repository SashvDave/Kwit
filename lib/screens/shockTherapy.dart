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
                image: AssetImage('assets/bg1.png'),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1200),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.vertical,
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
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('assets/bg21.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.height * 0.02,
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.height * 0.02),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "$i",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.height * 0.03,
                      MediaQuery.of(context).size.width * 0.15,
                      MediaQuery.of(context).size.height * 0.03),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: RaisedButton(
                    hoverElevation: 100,
                    child: Text(
                      "I'm ready to proceed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
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
