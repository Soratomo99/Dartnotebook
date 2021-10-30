# Một số basic đối với Dart

các hàm xử lý phổ biến chuyển đổi giữa double, int, String

```dart
void main() {
  double height = 1.88;
  String heightString = height.toString();
  String heightStringOne = height.toStringAsFixed(1);
  print("$heightString $heightStringOne"); // 1.88 1.9

  String ratingString = '4.8';
  double rating = double.parse(ratingString);
  print(rating); // 4.8
  int ratingInt = rating.round();
  print(ratingInt); // 5
}
```

## Xử lý toán học

Arithmetic: + &ensp; - &ensp; * &ensp; / &ensp; ~/ (chia lấy phần nguyên) &ensp; % (chia lấy dư: 5 / 2 = 1)

Relational: == != >= > <= <

Logical: || && !var var1 ? true{} : false{}

Augumented assignment: += &nbsp; -= &ensp; *= &ensp; /= &ensp; ~/= &ensp; %= &ensp; 

Bitwise: | &ensp; & &ensp; ^ &ensp; ~&ensp;  |= &ensp;  &= &ensp; ^= &ensp; ~=

Shifting: >> &ensp; << trong dart 2.12+ (flutter 2.0+) có thêm >>>

## Operator tăng giảm thường dùng

```dart
int x = 1;
int y = x++;
// khi này x = 2, y = 1

int a = 1;
int b = ++a;
// khi này a = 2, b = 2

int c = 1;
c++;
// khi này c = 2

int d = 1;
d += 2;
// khi này d = 3 và tương tự d = d + 2;
```
## Lưu ý về hex format, bitwise

```dart
int x = 0xF0; // binary: 11110000
int y = 0x0F; // binary: 00001111
print(x | y); // 255
print((x | y).toRadixString(16)); // ff
print((x | y).toRadixString(2)); // 11111111

print(y); // 15
print((y).toRadixString(16)); // f
print((y).toRadixString(2)); // 1111

int z = 8; // binary: 1000
print((x >> 1).toRadixString(2)); // 100
print((x << 2).toRadixString(2)); // 100000
print((x >> 2).toRadixString(2)); //10, = 2 vì 8 chia (2 mũ 2)
```

## Expressions và Statements

Expressions sẽ giữ giá trị trong lúc runtime (hold a value at runtime)

```dart
1 + 2
x + = 3
age > 16 ? 'adult' : 'child'
email.contains('@')
```

Statements không giữ giá trị (do not hold a value)

```dart
print('next value is ${value + 1}');
int y = x + 1;
print("this is a title");
```

runtime được định nghĩa là thời điểm chương trình chạy, khác nhau với compile time (thời điểm biên dịch chương trình), trong trường hợp xảy ra lỗi thấy được - lỗi logic nói chung thông qua runtime, còn lỗi xuất hiện khi biên dịch chương trình như lỗi cú pháp khi code.

giải thích với dart: https://youtu.be/J5DQRPRBiFI