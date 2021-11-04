# Error handing and Exceptions

Make code robust and improve user experience.

## Assertion

Assertions make it easier to diagnose and fix programing errors in code.

Assertions are enable in debug mode and disable in release mode.

```dart
class IntNotNegative{
  final int value;
  IntNotNegative(this.value) : assert(value > 0, "Value can not be negative");
}

void main(){
  IntNotNegative value = IntNotNegative(1);
  IntNotNegative value2 = IntNotNegative(-1); // message: Value can not be negative
}
```