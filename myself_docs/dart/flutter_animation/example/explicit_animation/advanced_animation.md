https://docs.flutter.dev/development/ui/animations/tutorial#curvedanimation

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
      duration: Duration(seconds: 2),
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
                  alignment: AlignmentDirectional.center,
                  children: [
                    BeamAnimation(
                      animation: CurvedAnimation(
                          parent: _animationController!,
                          curve: Curves.fastLinearToSlowEaseIn),
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

class BeamAnimation extends AnimatedWidget {
  final Widget _child;
  final Animation<double> animation;
  const BeamAnimation({
    Key? key,
    required this.animation,
    Widget? child,
  })  : _child = child ?? const SizedBox(),
        super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: _child,
        builder: (context, Widget? child) {
          return ClipPath(
            clipper: const BeamClipper(),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.5,
                  colors: [Colors.pink, Colors.transparent],
                  stops: [0, animation.value],
                ),
              ),
            ),
          );
        });
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }
}

```