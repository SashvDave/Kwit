import 'package:flutter/material.dart';
import 'package:kwit/screens/shockTherapy2.dart';
import 'package:kwit/screens/shockTherapy4.dart';

class ShockTherapy3 extends StatelessWidget {
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
                    "Why are e-cigarettes highly addictive?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
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
                      MediaQuery.of(context).size.height * 0.1),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Center(
                    child: Text(
                      "E-cigarettes/Vapes have a higher amount of nicotine in them compared to cigarettes leading to addiction almost 3 times faster than cigarettes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          0,
                          MediaQuery.of(context).size.height * 0.05),
                      child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShockTherapy2())),
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: MediaQuery.of(context).size.width * 0.13,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.height * 0.05),
                      child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShockTherapy4())),
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        iconSize: MediaQuery.of(context).size.width * 0.13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
