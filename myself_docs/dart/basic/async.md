# Async programing

When you need your app responsive while waiting for async operations to complete, using Future, Async, Await.

Streams: asynchronous events delivered over time.

## Future

A Future represents a result of an asynchronous operation. You can you a future to await for an synchronous operation to complete.

Futures have two state: uncompleted and completed

```dart
void main() {
  print("begin");
  fetchOrder("asd")
      .then((value) => print("The order is ... $value."))
      .catchError((error) => print(error))
      .whenComplete(() => print("Done"));
}

Future<String> fetchOrder(String order) async {
  await Future.delayed(Duration(seconds: 2));
  if (order != "Banhmi") {
    throw Exception("Out of stock");
  }
  return "Banhmi";
}
```

```dart
Future<void> main() async {
  print("begin");
  try {
    final order1 = await fetchOrder("Banhmi");
    final order2 = await fetchOrder("Ga");
  } catch (e) {
    print(e);
  } finally {
    print("Done");
  }
}

Future<String> fetchOrder(String order) async {
  await Future.delayed(Duration(seconds: 2));
  if (order != "Banhmi") {
    throw Exception("Out of stock");
  }
  return "Banhmi";
}
// begin
// Exception: Out of stock
// Done
```

## Stream

Stream is an asynchronous iterable, where event delivered over time.

```dart
Future<void> main() async {
  Stream<int> stream = Stream.fromIterable([1,2,3,4]);
  int sum = await sumStream(stream);
  print(sum);
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}
```
Can use yield multiple times to generate a stream

```dart
Future<void> main() async {
  Stream<int> stream2 = countStream(3);
  int sum = await sumStream(stream2);
  print(sum);
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (var value in stream) {
    print(value);
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int count) async* {
  for (var i = 0; i <= count; i++) {
    await Future.delayed(Duration(seconds: 1));
    print(i);
    yield i;
  }
}
```
## Streams vs Interables

| keyword   | iterated over with a for loop | created with generator functions | methods to process and modify items | type         |
|-----------|-------------------------------|----------------------------------|-------------------------------------|--------------|
| iterables |              yes              |                yes               |                 yes                 | synchronous  |
| streams   |              yes              |                yes               |                 yes                 | asynchronous |
