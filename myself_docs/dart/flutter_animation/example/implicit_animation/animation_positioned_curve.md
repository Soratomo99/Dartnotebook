You can make animation with The Curve animation. Example: add property "curve":

https://api.flutter.dev/flutter/animation/Curves-class.html

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(ImplicitAnimation());
}

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  int value = 0;
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
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (value == 0)
                        value = 1;
                      else
                        value = 0;
                    });
                  },
                  child: Stack(
                    children: [
                      // Positioned widgets are placed directly inside Stack widgets.
                      AnimatedPositioned(
                        curve: Curves.bounceInOut,
                        // extend Positioned widget
                        duration: Duration(seconds: 1),
                        height: value == 0 ? 100 : 200,
                        width: value == 0 ? 100 : 200,
                        top: value == 0 ? 50 : 0,
                        left: value == 0 ? 50 : 0,
                        child: Container(
                          color: Colors.pink,
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
    );
  }
}

``