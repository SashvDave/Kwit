import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCardv2 extends StatelessWidget {
  final String title;
  final Function press;
  const CategoryCardv2({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: const Color(0xFFE6E6E6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFF),
                image: DecorationImage(
                  image: AssetImage('assets/cardbg4.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: new Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontSize: 15),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
