void main() {
  Map person = {
    'name' : "My Name",
    'age': 22,
    'height': 1.7
  };
  Map<String, dynamic> person2 = {
    'name' : "My Name 2",
    'age': 22,
    'height': 1.7
  };
  Map person3 = <String, dynamic> {
    'name' : "My Name 3",
    'age': 22,
    'height': 1.7
  };
  var name = person['name'];
  print(name);
  // them cap key - value
  person['likesCode'] = true;
  print(person);

  for(var key in person.keys) {
    print(key);
    print(person[key]);
  }
  for(var entry in person.entries){
    print("${entry.key} : ${entry.value}");
  }
}