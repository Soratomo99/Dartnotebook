# Const và Final trong Dart

const là compile-time constant

final là runtime constant

đối với const, cần khai báo giá trị ngay khi khởi tạo, chưa cần biết có sử dụng hay không.

đối với final, không cần thiết khai báo giá trị ngay khi khởi tạo vì nó có thể hiểu là sẽ có giá trị trong quá trình thực thi. Chỉ cần có giá trị trước lần sử dụng đầu tiên.

### Lưu ý: giá trị của biến final không thể re-assigned (tái khởi tạo) nhưng có thể thay đổi nội dụng (modify their contents).

```dart
  final List<String> listName = ["Name A", "Name B", "Name C"];
  listName = ["ABC"]; // lỗi
  listName[1] = "Name b"; // chấp nhận
```
### Lưu ý: produces runtime error

```dart
  const List<String> listName = ["Name A", "Name B", "Name C"];
  listName[1] = "Name b"; // chấp nhận, không báo lỗi nhưng khi thực thi runtime sẽ bị lỗi
```
```dart
void main() {
  const int i = 1;
  final int a;
  const int b; // lỗi
}
```
Khác với const, final có thể cập nhật giá trị trong quá trình runtime, điều này giống let trong swift, const trong javascript và final trong java

```dart
void main() {
  const String a = "name";
  const String b = a.toUpperCase(); // lỗi
  final String c = a.toUpperCase(); // chấp nhận

  final List<int> listInt = [];
  listInt.add(1);
}
```

Trong quá trình sử dụng const trong class, cần thêm static vì coi như đây là biến static (chỉ khởi tạo khi sử dụng lần đầu tiên) để tránh lãng phí tài nguyên.

```dart
  static const String = "Constant";
```

```dart
  class Capital {
    final String name;

    const Capital(this.name);
  }

  class Country {
    final Capital capital;
    final String name;

    const Country(this.name, { required this.capital });
  }

  const hanoi = const Capital("Hanoi");
  const vietnam = const Country("Viet Nam", capital: hanoi);
```
Các object có giá trị giống nhau được khởi tạo nhiều lần thì constant constructor không sinh ra thêm object mới mà tái sử dụng lại object đã có (canonical instance). Quan trọng trong tối ưu hệ thống.

Flutter khuyến khích dùng const cho widget để không phải re-build đối với widget mỗi khi hàm build được gọi.

```dart
var vietnam = const Country("Viet Nam", capital: hanoi);
var vietnam2 = const Country("Viet Nam", capital: hanoi);
var vietnam3 = const Country("Viet Nam", capital: hanoi);

//Cả 3 object vietnam, vietnam2, vietnam3 đều là một
assert(identical(vietnam, vietnam2)); //✅
assert(identical(vietnam2, vietnam3)); //✅

//Nếu biến là const và object có constant constructor
//có thể lược giản thành
const vietnam = Country("Viet Nam", capital: hanoi);
```
Lưu ý: nếu không khai báo const, const constructor sẽ thành constructor bình thường

```dart
var vietnam = const Country("Viet Nam", capital: hanoi);

//fakeVietnam không được khởi tạo bằng constant constructor
var fakeVietnam = Country("Viet Nam", capital: hanoi);

//Hai object vietnam và fakeVietname không còn là một
assert(identical(vietnam, fakeVietnam)); //❌


//Nếu muốn dùng constant construct hãy trực tiếp thêm const cho hàm khởi tạo
var fakeVietnam = const Country("Viet Nam", capital: hanoi);
//hoặc thêm const cho biến
const fakeVietnam = Country("Viet Nam", capital: hanoi);

assert(identical(vietnam, fakeVietnam)); //✅
```