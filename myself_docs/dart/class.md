# CLASS

Class is used to represent new types.

Instance variable of class is a default value of variable of class. When you want to create a default value or make sure this variable not be nullable at the first create.

```dart
class A{
    int a = 0;
}
// when using
final test = A();
print(test.a); // 0
```
Class uses keyword "this" to point themself, it makes you not confuse when variable class's properties are the same as arguments.

```dart
class Person {
    String name;
    Person(String name){
        this.name = name;
    }
    // or
    Person(String name) : this.name = name;
    // or
    Person({required this.name});
}
```
When using const constructor, all variables much is final

```dart
class Person {
    String name; // error
    final String name;
    const Person({required this.name});
}
```
Name constructor

Sometime, you have alot of constructor for special cases, you should use name constructor to indentify them.

```dart
class Person {
    final String name;
    final String job;
    const Person({required this.name, required this.job});
    Person.teacher({required this.name, this.job = 'teacher'});
    // or
    Person.student({required this.name}) : job = 'student';
}
class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.farenheit(double farenheit) : celsius = (farenheit - 32) / 1.8;
  double celsius;
  double get farenheit => celsius * 1.8 + 32; // double farenheit() => celsius * 1.8 +32;
  // this time: farenheit is computer variable, celsius is stored memory variable
  set farenheit(double celsius) => celsius = (farenheit - 32) / 1.8;
}
void main() {
    var teacherA = Person.teacher(name:"Lemon");
}
```

### NOTICE: Using static const to define a global constant that belongs to a class

```dart
void main() {
  print(A.lable);
}
class A {
  static const lable ="A";
}
```
You can set private methods or variables by adding "_" before them. When in private mode, you will not allowed to modify outside of class.

```dart
class A {
  String _name ="name";
  String get name => _name;
}
void main() {
  var a = A();
  a._name = "b"; // error
  print(a.name);
}
```
## Subclassing/Inheritance

subclassing: extend the functionality of an existing class and increase code reuse

```dart
void main() {
  var animal = Animal();
  animal.sleep();
  var dog = Dog();
  dog.sleep();
  dog.bark();
}
class Animal {
  void sleep(){
    print('sleep');
  }
}
class Dog extends Animal {
  void bark() {
    print('bark');
  }
}
```

## Super constructor

This is how to reuse an existing constructor of a parent class

```dart
void main() {
  var dog = Dog(dogAge: 5);
}
class Animal {
  final int age;
  Animal({required this.age});
  void sleep(){
    print('sleep');
  }
}
class Dog extends Animal {
  Dog({required int dogAge}) : super(age: dogAge);
  void bark() {
    print('bark');
  }
}
```
## Override method

@Override is a declaration of intent

```dart
void main() {
  var dog = Dog(dogAge: 5);
  dog.sleep();
}
class Animal {
  final int age;
  Animal({required this.age});
  void sleep(){
    print('sleep');
  }
}
class Dog extends Animal {
  Dog({required int dogAge}) : super(age: dogAge);
  void bark() {
    print('bark');
  }
  @override
  void sleep(){
    super.sleep();
    print("dog sleep");
  }
}
// sleep
// dog sleep
```
## Asbtract class

asbtract class can not be instantiated

sometime, you want to use the same functions or code to alot of object with similar each other.

we can you abstract class to define an interface that can be implemented by subclass.

```dart
void main() {
  var A = Square(2);
  printArea(A);
  List<Shape> shapes = [Square(2), Circle(3)];
  for(var item in shapes) {
    printArea(item);
  }
}

abstract class Shape {
  double get area;
}
class Square extends Shape {
  double side;
  Square(this.side);
  @override
  double get area => side * side;
}
class Circle extends Shape {
  double side;
  Circle(this.side);
  @override
  double get area => side * 3.14 * 3.14;
}

void printArea(Shape shape){
  print(shape.area);
}
```

## Extends vs Implements

| keyword    | type     | abstract methods | concrete methods |
|------------|----------|------------------|------------------|
| extends    | single   | must override    | can override     |
| implements | multiple | must override    | must override    |

## toString()

```dart
void main() {
  print(A("the value"));
  // Instance of 'A'
}

class A {
  String a;
  A(this.a);
}
```

```dart
void main() {
  print(A("the value"));
  // the value
}

class A {
  String a;
  A(this.a);
  @override
  String toString() {
    return '$a';
  }
}
```

## Operator

Dart default doesn't know what object created how to use operator as we expected. Because of their hashcode.

Each object have their hashcode.

```dart
void main() {
  List<int> a = [1,2];
  var b = a;
  b[0] = 2;
  print(a.hashCode);
  print(b.hashCode);
  print(a);
  print(b);
// 643653109
// 643653109
// [2, 2]
// [2, 2]
}
```

```dart
void main() {
  print(Point(1, 2) == Point(1, 2));
  // false
}

class Point{
  final int x;
  final int y;
  const Point(this.x, this.y);
}
```

```dart
void main() {
  print(Point(1, 2) == Point(1, 2));
  // true
}

class Point{
  final int x;
  final int y;
  const Point(this.x, this.y);

  @override
  bool operator ==(Object object) {
    if(object is Point){
      return x == object.x && y == object.y;
    } else
    return false;
  }
}
```
You should use covariant to define type (not Object) of argument when using override 

```dart
@override
  bool operator ==(covariant Point object) {
    if(object is Point){
      return x == object.x && y == object.y;
    } else
    return false;
  }
```

## Stack push pop class

```dart
void main(){
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  print(stack.pop()); // pop stack[1] --> output: 2
}

class Stack<T> {
  final List<T> _items = [];
  void push(T item) {
    _items.add(item);
  }
  T pop() {
    return _items.removeLast();
  }
}
```

## Factory constructor

Rerular constructor: all final variables must be initialized immediately (as aruments or with a initializer list).

Factory constructor: can execute any arbitrary logic first, and then return an instance.

```dart
abstract class Shape {
  double get area;
  const Shape();

  factory Shape.fromJson(Map<String, Object> json) {
    final type = json['type'];
    switch (type) {
      case 'square': 
        final side = json['side'];
        if(side is double) {
          return Square(side);
        }
        throw UnsupportedError('invalid or missing side property');
      case 'circle': 
        final radius = json['radius'];
        if(radius is double) {
          return Circle(radius);
        }
        throw UnsupportedError('invalid or missing side property');
      default:
        throw UnsupportedError('shape $type not recognized');
    }
  }
}
void printArea(Shape shape) {
  print(shape.area);
}
class Square extends Shape {
  double side;
  Square(this.side);
  @override
  double get area => side * side;
}
class Circle extends Shape {
  double side;
  Circle(this.side);
  @override
  double get area => side * 3.14 * 3.14;
}

void main() {
  final shapeJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    }
  ];
  final shapes = shapeJson.map((shapeJson) => Shape.fromJson(shapeJson));
  shapes.forEach(printArea);
}
```

## copyWith

You can copy variables's value of an Object to the one. This example show how to do it

```dart
void main() {
  const variableA = A(a: "test 1", b: "test 2");
  final variableB = variableA.copyWith(c: "test 3");
  print(variableB);
  // test 3 and test 2
}

class A {
  final String a;
  final String b;
  const A({this.a ='', this.b = ''});

  A copyWith({String? c, String? d}){
    return A(
      a: c ?? this.a,
      b:  d ?? this.b,
    );
  }
  @override
  String toString(){
    return "$a and $b";
  }
}
```

## Cascade 

cascade make you reduce your code

```dart
void main(){
  var a = A("name") ..changeToDefault();
  //var a = A("name"); a.changeToDefault();
  print(a.name);
}

class A {
  String name;
  A(this.name);
  void changeToDefault() {
    this.name = "defalut value";
  }
}
```