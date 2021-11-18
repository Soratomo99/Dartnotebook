You can custom animation curve. 

create class extend Curve class.

```dart
class SineCurve extends Curve {
  final double count;
  SineCurve({this.count = 1});
  @override
  double transformInternal(double t) {
    return sin(count * 2 * t * pi) * 0.5 + 0.5;
  }
}
```

then, add to property curve.

```dart
AnimatedPositioned(
    curve: SineCurve(),
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
```