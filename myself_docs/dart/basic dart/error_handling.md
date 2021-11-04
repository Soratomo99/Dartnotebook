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
Use rethrow to handle the exception inside a catch block, propagate the exception to the calling code.

```dart
class Fraction{
  final int numerator;
  final int denominator;
  Fraction(this.numerator, this.denominator){
    if(denominator == 0){
      throw IntegerDivisionByZeroException();
    }
  }
  double get value => numerator / denominator;
}
void testFraction(){
  try {
    final test = Fraction(1, 0);
    print(test.value);
  } on IntegerDivisionByZeroException catch (e) {
    print(e);
    rethrow;
  } on Exception catch(e) {
    print(e);
  } finally {
    print("test done");
  }
}
void main(){
  testFraction(); 
  // IntegerDivisionByZeroException
  // test done
  // show where is exception in debug console
}
```