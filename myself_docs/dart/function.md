# Function in Dart

Functions is essential building blocks to organize code and make it more reusable.

## Notice: "PURE FUNCTION" is a function always produces the same result when call with the same arguments, doesn't mutage any variables outside its own scope.

```dart
int counter = 1;

void main() {
  foo();
  foo();
  foo();
}

void foo() {
  print('*' * counter);
  counter++;
}

// *
// **
// ***

// foo() is not a pure function
```

# Tham chiếu và tham trị

Dart là ngôn ngữ coi tất cả kiểu dữ liệu là đối tượng, kiểu dữ liệu gốc trong Dart là tham chiếu. 

Cần lưu ý sử dụng trong 

```dart
void main() {
  int x = 1;
  int y = x;
  y = 2;
  print(x);
  // test with list
  List<int> list = [1, 2, 3];
  test(list);
  print(list);
  // test with one variable
  int a = 1;
  test2(a);
  print(a);
  // test with class
  Person person = Person("Nene");
  test3(person);
  print(person.name);
  // output:
  // 1
  // [0, 2, 3]
  // 1
  // Amano
  // Có thể sử dụng tham chiếu bằng cách này cho collection và class, trừ build-in type
}

void test(List<int> list) {
  List<int> b = list;
  b[0] = 0;
}

void test2(int a) {
  int b = a;
  b = 0;
}

void test3(Person a) {
  Person b = a;
  b.name = "Amano";
}

class Person {
  String name;
  Person(this.name);
}
```
### Name arguments and Null Safety arguments in function

This is how to use null safety with name arguments in function. You need to name arguments in function because it will make you not be confused when working with function, specially these is alot of arguments.

```dart
void main() {
  person(name: "Nene Amano");
}

void person({
  required String name, 
  bool isVtuber = true, // if you not set a value, it is a default value of argument
  int? age
}) {
  if(age != null) print("Vtuber $name is $age years old");
  else print("Vtuber $name");
}
```
You can make default value positional arguments

```dart
void main() {
  test(1);
  test(1, 3);
}

void test(int a, [int b = 2]) {
  print("$a and $b");
}
// 1 and 2
// 1 and 3
```

```dart
// you can not use default value positional arguments and name agruments as the same in one function
void test(int a, {required int c, int? d}, [int b = 3]) {
  print("$a and $b");
} // error

void test(int a, {required int c, int? d}) {
  print("$a and $c");
} 
```
## Fat arrow notation

You can use fat arrow notation as return

```dart
void main() {
  test(1, 2);
  test2(1, 2);
  print(test3(1, 2));
  print(test4(1, 2));
}
void test(int a, int b) => print("$a and $b");
void test2(int a, int b) {
  print("$a and $b");
}
int test3(int a, int b) => a + b;
int test4(int a, int b) {
  return (a + b);
}
```
## Anonymous Function 

an anonymous function used alot when you make a callback function

```dart
void main() {
  (name) => print("Hi $name");
  final Function say = (name) => "Hi $name";
  print(say);
  print(say("Nene"));
}
// Closure: (dynamic) => String
// Hi Nene
```
## Function as a argument

```dart
void main() {
  test( Total, 3);
}

int Total(int a, int b) => a + b;

void test(int Function(int a, int b) func, int x) {
  print("${func(1, 2)} and $x");
}
// or you can use typedef 
void main() {
  test( Total, 3);
}

int Total(int a, int b) => a + b;

typedef typedefFunction = int Function(int, int);

void test(typedefFunction func, int x) {
  print("${func(1, 2)} and $x");
}
```
### NOTICE: LAZY ITERABLE is an anonymous function is not evaluated until the result is used (performance optimization)

## Map, ForEach

```dart
void main() {
  int multi = 10;
  List<int> list = [1, 2, 3];
  final result = list.map((e) { // this is an iterable
    return e * multi;
  });
  // the way to avoid iterable
  final List<int> result2 = list.map((e) { 
    return e * multi;
  }).toList(); 

  result.forEach((element) {
    print(element);
  });
  result.forEach(print);
}

```
## Generics

Generics are used to write a type-safe code and reduce code duplication

This is an example show how to transform List int to List String

```dart
void main() {
  const list = [1, 2, 3];
  list.forEach((element) {print(element);});

  final doubles = transform(list, (x) => x * 2);
  print(list);
  print(doubles);

  // 1
  // 2
  // 3
  // [1, 2, 3]
  // [2, 4, 6]

  const listString = ['a', 'b', 'c'];

  final listString2 = transform2<int, String>(list, (x) => x.toString() + "a");

  print(listString2);
  // [1a, 2a, 3a]
}

List<int> transform(List<int> items, int Function(int) f) {
  var result = <int>[];
  for(var x in items) {
    result.add(f(x));
  }
  return result;
}

List<R> transform2<T, R>(List<T> items, R Function(T) f) {
  var result = <R>[];
  for(var x in items) {
    result.add(f(x));
  }
  return result;
} // T is to, R is return
```
## Where in List

```dart
void main() {
  List<int> list = [1, 2, 3, 4, 5, 6];
  final even = list.where((element) => element % 2 == 0);
  // where((element in list) return check bool true)
  print(even);
  // (2, 4, 6)
  final evenFirst = list.firstWhere((element) => element % 2 == 0);
  print(evenFirst);
  // 2

  // the same way
  List<T> where<T>(List<T> items, bool Function(T) f){
    var result = <T>[];
    for(var item in items) {
      if(f(item)){
        result.add(item);
      }
    }
    return result;
  }
} 
```
## Rewrite firstWhere in List

```dart
void main() {
  List<int> list = [1, 2, 3, 4, 5, 6];
  
  T FirstWhere<T>(List<T> items, bool Function(T) f, {required T Function() orElse}){
    for(var item in items){
      if(f(item)){
        return item;
      }
    }
    return orElse();
  }

  int result = FirstWhere(list, (e) => e % 3 == 0, orElse: () => -1);
  print(result);
  // 3
} 
```

## Reduce in List

reduce: a method of List is used to combine all item inside a list and produce a single result

```dart
void main() {
  List<int> list = [1, 2, 3, 4, 5, 6];
  
  int result = list.reduce((value, element) => value + element);
  print(result);
  // 21
} 
```
## Email check 

This is how to combine all of them

```dart
void main() {
  const emails = [
    'abc@abc.com',
    'abc@gmail.com',
    'abc@gmail.vn',
    'abc@gmail.uk',
  ];
  const accessDomain = ['gmail.com', 'gmail.vn'];

  final unaccessDomain = emails.map((e) => e.split('@').last).where((element) => !accessDomain.contains(element));
  print(unaccessDomain);

  final unaccess = getUnaccessDomain(emails, accessDomain);
  print(unaccess);

  final unaccess2 = getUnaccessDomain2(emails, accessDomain);
  print(unaccess2);

  // abc.com, gmail.uk
} 

Iterable<String> getUnaccessDomain(List<String> emails, List<String> accessDomain){
  return emails.map((e) => e.split('@').last).where((element) => !accessDomain.contains(element));
}

Iterable<String> getUnaccessDomain2(List<String> emails, List<String> accessDomain){
  var result = <String>[];
  for(var email in emails){
    final domain = email.split('@').last;
    if(!accessDomain.contains(domain)){
      result.add(domain);
    }
  }
  return result;
}
```