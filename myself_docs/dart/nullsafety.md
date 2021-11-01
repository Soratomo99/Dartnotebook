# Null Safety

With null Safety, languages can decide at compile time if variable can be null or not. If we can guarantee that a value is never null, we don't need to check for it.

You can decide Null Safety by add '?' after the type of variable. 

```dart
// with null safety - dart 2.12+
int a; // error, this variable can not be null, much set value of this.
int? a; // yes, it can be null
```
Somehow, when you code, you not see a error. Because you don't use Dart 2.12+

```dart
void main() {
  int a = 1;
  int? b;
  print(a + b);
}
```
When not using null safety, a variable much have a value before doing something.

```dart
void main() {
  int a = 0;
  int b;
  if(a == 0) b = 1;
  else b = 0;
  print(b);
}
```
If you sure that a nullable variable will always have a non-nullable value, you can use assertion operator ('!')

```dart
void main() {
  int? a;
  int b = 0;
  if(b == 0) a = b;
  int value = a!;
  print(value);
}
// you will get a runtime error if b != 0
```

The solution when you stuck with null safety

```dart
int? a;
int value = a == null ? 0 : a; // set default value for value-variable if a is null
// or you can do another way
int value2 = a ?? 0; 
// another solution
a ?? 0;
int value3 = a;
```

## Null Safety with Collections

Null Safety can cause an error if you not decide Nullable to Collections, this is the solution 

```dart
void main() {
  List<int?> listInt = [0, 1, 2, null];
  for(var item in listInt){
    if(item != null)
      print(item);
  }
}
// if you not using if-flow control, var item is not nullable and you don't check null values, a runtime error will show.
```
```dart
void main() {
  List<int?> listInt = [0, 1, 2, null];
  for(var item in listInt){
      print(item?);
  }
}
// can print null values
```