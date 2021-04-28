import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kwit/screens/login.dart';
import 'package:kwit/screens/triggers.dart';

void main() => runApp(Timer());

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountDownTimer(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          accentColor: const Color(0xFFABF6D4)),
    );
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF235866),
        title: Text('Mediquit: Emotion Relief'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Trigger())),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/timerbg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  child: Column(
                                    children: <Widget>[
                                      if (timerString.toString() == '0:00')
                                        (Container(
                                            margin: EdgeInsets.only(
                                              top: 40,
                                              left: 80,
                                              right: 80,
                                            ),
                                            child: Text(
                                              "Hello! Use this timer to keep track of your progress!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.white),
                                            ))),
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: AnimatedBuilder(
                                            animation: controller,
                                            builder: (context, child) {
                                              return FloatingActionButton
                                                  .extended(
                                                      onPressed: () {
                                                        if (controller
                                                            .isAnimating)
                                                          controller.stop();
                                                        else {
                                                          controller.reverse(
                                                              from: controller
                                                                          .value ==
                                                                      0.0
                                                                  ? 1.0
                                                                  : controller
                                                                      .value);
                                                        }
                                                      },
                                                      icon: Icon(controller
                                                              .isAnimating
                                                          ? Icons.pause
                                                          : Icons.play_arrow),
                                                      label: Text(
                                                          controller.isAnimating
                                                              ? "Pause"
                                                              : "Play",
                                                          style: TextStyle(
                                                              fontSize: 30.0,
                                                              color: Colors
                                                                  .black)));
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
