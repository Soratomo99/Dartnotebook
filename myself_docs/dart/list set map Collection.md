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