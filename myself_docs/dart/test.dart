Future<void> main() async {
  Stream<int> stream2 = countStream(3);
  int sum = await sumStream(stream2);
  print(sum);
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (var value in stream) {
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