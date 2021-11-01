# List Set Map trong Dart

## List

List được coi là một mảng các object, có thể được định nghĩa cụ thể trong <> 

```dart
List name = ['name A', 'name B', 'name C'];
List<String> name2 = ['name A', 'name B', 'name C'];
```
các hàm xử lý phổ biến: length, isEmpty, isNotEmpty, add, insert, removeAt, clear, contains, indexOf

### Lưu ý: giá trị của biến final không thể re-assigned (tái khởi tạo) nhưng có thể thay đổi nội dụng (modify their contents).

```dart
  final List<String> listName = ["Name A", "Name B", "Name C"];
  listName = ["ABC"]; // lỗi
  listName[1] = "Name b"; // chấp nhận
```
## Set

Set cũng là collection theo chuỗi giống như list nhưng có tính độc nhất trong các element mà nó chứa

```dart
void main() {
  Set set1 = {'Aa', 'Bb', 'Cc'};
  set1.add("Bb");
  print(set1);
  Set set2 = {'Cc', 'Dd', 'Dd'};
  print(set1.union(set2));
// {Aa, Bb, Cc}
// {Aa, Bb, Cc, Dd}
}
```
các hàm xử lý phổ biến: union, intersection, difference. Có thể kết hợp các hàm với nhau

```dart
  final Set c = set1.union(set2).difference(set1.intersection(set2));
  print(c);
  // {Aa, Bb, Dd}
```
## Map

map là danh sách các cặp key - value, có thể định nghĩa cặp key - value trong <> và có cách viết như sau

```dart
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
  // My Name
  // {name: My Name, age: 22, height: 1.7, likesCode: true}
}
```
trong quá trình xử lý map có thể gặp trường hợp trả dữ liệu sang var - dynamic, nếu cần xử lý bởi các hàm dựng sẵn thì có thể dùng cách sau

```dart
var name = person['name'] as String;
print(name.toUpperCase());
```
lưu ý là giá trị theo key có thể null

khác với list và set, xử lý vòng lặp trong map không trả về element cụ thể

```dart
  // bị lỗi
  for(var element in person) {
  }
  // không bị lỗi
  for(var key in person.keys) {
    print(key);
    print(person[key]);
  }
  // name
  // My Name
  // age
  // 22
  // height
  // 1.7
  // likesCode
  // true
  for(var entry in person.entries){
    print("${entry.key} : ${entry.value}");
  }
```
## Basic example 

```dart
void main() {
  const Map Menu = {
    'bunbo': 20,
    'pho': 30,
    'banhmi': 15,
  };
  const order = ['pho','banhmi'];
  var total = 0;
  for (var item in order) {
    final int? price = Menu[item];
    if(price != null){
      total += price;
    } else {
      print("${item} is not on the menu");
    }
  }
  print('total: $total');
}
```
## Nested Collections

```dart
void main() {
  // Nested collections
  List<Map<String, String>> idols =[
    {
      'name': 'Nene Amano',
      'description': 'Kawaii production vtuber first gen!'
    },
    {
      'name': 'Satsuki Lemon',
      'description': 'Vtuber of HiroshimaTV'
    },
  ];
  for( Map idol in idols) {
    print(idol);
  }
}
```
Ngoài ra có thể sử dụng if, for bên trong collection 

```dart
void main() {
  bool isVTuber = true;
  List<String> vtubers = ['Fubuki', 'Suisei'];
  List<String> names = [
    "Nene Amano",
    "Satsuki Lemon",
    if(isVTuber) "Sora",
    // lỗi
    // if(isVTuber) {
    //   "Sora";
    // }
    for( String vtuber in vtubers) vtuber,
  ];
  //names.addAll(vtubers);
}
```

## Spreads 

when you add something into Map, example: add list into Map, add String into value of key, if you don't use "..." you will get [], because you is adding something into map, not add information of something to the map

```dart
void main() {
  bool isVTuber = true;
  List<String> vtubers = ['Fubuki', 'Suisei'];
  List<String> names = [
    "Nene Amano",
    "Satsuki Lemon",
    if(isVTuber) ...vtubers
  ];
  print(names);

  String project = 'Kawaii';
  Map<String, String> idol = {
    'name': "Nene Amano",
    'gender': 'female',
    if(isVTuber) ... {
      "isVtuber" : "true",
      "project": project,
    }
  };
  print(idol);
}
```
## How to copy the collection 

```dart
void main() {
  final List list1 = [1, 2, 3];
  final List list2 = list1;
  list2[0] = 0;
  // list1: 0, 2, 3
  // list2: 0, 2, 3
  // not actually a way to copy, all of them use the same menory

  // the true way to copy is
  final List list3 = [
    for(var item in list1) item,
  ];
  final List list4 = [
    ...list1
  ];
}
```
```dart
void main() {
  final Map nene = {
    "name" : "Nene Amano",
    "isVtuber": true
  };
  final Map neneCopy = nene;
  neneCopy["isVtuber"] = false;
  print(nene);
  print(neneCopy);
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: false}
  final Map theTrueNene = {...nene};
  theTrueNene["isVtuber"] = true;
  print(nene);
  print(neneCopy);
  print(theTrueNene);
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: true}
}
```