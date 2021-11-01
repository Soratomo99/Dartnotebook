# Null Safety

With null Safety, languages can decide at compile time if variable can be null or not. If we can guarantee that a value is never null, we don't need to check for it.

You can decide Null Safety by add '?' after the type of variable. 

```dart
// with null safety - dart 2.12+
int a; // error, this variable can not be null, much set value of this.
int? a; // yes, it can be null
```
Somehow, when you code, you not see a error.

```dart
void main() {
  int a = 1;
  int? b;
  print(a + b);
}
```