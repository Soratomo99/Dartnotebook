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

class _ImplicitAnimationState extends State<ImplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

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
                    RotationTransition(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_animationController!.isAnimating)
                              _animationController!.stop();
                            else
                              _animationController!.repeat();
                          });
                        },
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.pink,
                        ),
                      ),
                      turns: _animationController!,
                    ),
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