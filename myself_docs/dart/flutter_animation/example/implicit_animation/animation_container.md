This widget extend Container widget

https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html

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
            GestureDetector(
              onTap: () {
                setState(() {
                  if (value == 0)
                    value = 1;
                  else
                    value = 0;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: value == 0 ? 100 : 200,
                width: value == 0 ? 100 : 200,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(value == 0 ? 50 : 10),
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