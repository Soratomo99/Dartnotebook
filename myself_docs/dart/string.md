# Một số lưu ý sử dụng hàm print()

hàm print() trả về theo object 

```dart
void main() {
  String name = "Name";
  int age = 22;
  print("The name is $name and age is $age");
  // print("The name is$nameand age is$age");
  // bug: thiếu khoảng trống, cách fix:
  print("The name is${name}and age is${age}");
  print("age is $age + 1 next year");
  print("age is ${age + 1} next year");

  // The name is Name and age is 22
  // The name isNameand age is22
  // age is 22 + 1 next year
  // age is 23 next year
}
```

ngoài ra có lưu ý về escape String print và Raw String

```dart
  print("this is '");
  print('this is \'');
  print("this is \n");
  print(r"this is \n");
  //this is '
  //this is '
  //this is 
  //
  //this is \n
```

multiline String có 2 cách viết phổ biến

```dart
  print("Lorem ipsum dolor sit ame. \nconsectetur adipiscing eli. \ntsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam. quis nostrud exercitation ullamco");
  print('''
  Lorem ipsum dolor sit ame. 
  consectetur adipiscing eli. \ntsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
  Ut enim ad minim veniam. quis nostrud exercitation ullamco''');
```

những hàm dựng sẵn của kiểu dữ liệu trong dart có thể print theo cách cách sau

```dart
  String test = "Test";
  print(test.toUpperCase());
  String test2 = "Test2".toUpperCase();
  print(test2);
```

một số hàm xử lý String thường gặp

```dart
  String Title = "This is title";
  print(Title.contains("title"));
  print(Title.replaceAll("title", "a content"));
  print(Title.isEmpty);
  // true
  // This is a content
  // false
```