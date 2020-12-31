import 'package:flutter/material.dart';
import 'package:kwit/screens/dashboard.dart';

class ShockTherapy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Text(
                  "Why should you stop vaping?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      child: Text(
                        "\n63% of people that start vaping do not know that vapes contain nicotine, a highly addicting chemical.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      color: Colors.transparent,
                      child: Text(
                        "\nE-cigarettes/Vapes have a higher amount of nicotine in them compared to cigarettes leading to addiction almost 3 times faster than cigarettes.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      color: Colors.transparent,
                      child: Text(
                        "\nJUULs can deliver higher nicotine intakes 2.7 faster than other e-cigarettes.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      color: Colors.transparent,
                      child: Text(
                        "\nSince the U.S. does not have nicotine concentration limits for JUULs they can contain up to 7% nicotine salt concentration.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      color: Colors.transparent,
                      child: Text(
                        "\nThe use of e-cigarettes/vapes leads to a 7x higher odds of ever using cigarettes and 8x higher odds of using cigarettes within the next year.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015),
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      color: Colors.transparent,
                      child: Text(
                        "\nYoung adults are getting addicted to vapes and e-cigarettes with an alarmingly high rate of about 20% of high schoolers having used a e-cigarette before.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8,
                  color: Colors.transparent,
                  child: Text(
                    "\nBy the end of 2019 there were over 2,000 cases and 39 deaths reported due to vaping. The number continues to grow as vaping has turned into an epidemic.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              new Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
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
        )
      ]),
    );
  }
}
