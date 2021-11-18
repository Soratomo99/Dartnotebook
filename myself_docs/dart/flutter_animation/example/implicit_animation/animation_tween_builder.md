If animation not want a set state function, just do something and then end the animation. Using tweenBuilder.

```dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(ImplicitAnimation());
}

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count = 1});
  @override
  double transformInternal(double t) {
    return sin(count * 2 * t * pi) * 0.5 + 0.5;
  }
}

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double _end = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Text("Tap the shape"),
            SizedBox(
              height: 100,
            ),
            Flexible(
              child: Container(
                color: Colors.transparent,
                height: 200,
                width: 200,
                child: Stack(
                  children: [
                    // Positioned widgets are placed directly inside Stack widgets.
                    TweenAnimationBuilder<double>(
                        tween: Tween(begin: _end - 10, end: _end),
                        curve: Curves.slowMiddle,
                        duration: Duration(seconds: 4),
                        // tip to make repeated animation
                        onEnd: () {
                          setState(() {
                            _end = _end == 45 ? 0 : 45;
                          });
                        },
                        builder: (context, double angle, __) {
                          return Transform.rotate(
                            angle: angle,
                            child: Container(
                              color: Colors.pink,
                              height: 200,
                              width: 200,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```