void main() {

  List<String> listString = ["a", "b", "c"];
  for(int i = 0; i < listString.length; i++){
    print(listString[i]);
  }

  //forEach cách 1
  List<int> listInt = [];
  for(int i = 0; i < 3; i++) {
    listInt.add(i);
    print(i);
  }
  listInt.forEach((element) { print(element);});

  //forEach cách 2
  for(final integer in listInt) {
    print(integer);
  }

  //forEach cách 3
  listInt.forEach(print);
}