import 'package:flutter/material.dart';
import 'package:kwit/main.dart';
import 'package:kwit/screens/stress2.dart';
import 'package:kwit/screens/widgets/category_card.dart';

class Stress1 extends StatefulWidget {
  @override
  _Stress1State createState() => _Stress1State();
}

class _Stress1State extends State<Stress1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      appBar: AppBar(
        title: Text('Kwit: Stress Relief Exercise'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg15.png'),
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
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "The exercises below have been proven to release Stress & Anxiety",
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .display1
                          .copyWith(color: Colors.white),
                    ),
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
                          ),
                          CategoryCard(
                            title: "Kegel Exercises",
                          ),
                          CategoryCard(
                            title: "Meditation",
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Yoga",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: 400,
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Stress2();
                          }),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Text('Next',
                          style: TextStyle(color: Colors.black, fontSize: 17)),
                      padding: const EdgeInsets.all(13.0),
                      splashColor: Colors.lightBlue[200],
                      color: const Color(0xFFB8ECF0),
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
