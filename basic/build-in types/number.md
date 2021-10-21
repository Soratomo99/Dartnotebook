# Build-in types

## Number

### int 

không lớn hơn 64bits, có thể chứa từ -2 mũ 63 đến 2 mũ 63 - 1 (trừ 1 vì có số 0)


### double

64bits, theo tiêu chuẩn IEEE 754


### lưu ý

có thể dùng abs(), ceil(), floor(), ... trong đó abs() trả về số nguyên, ceil() trả về số nguyên nhỏ nhất không nhỏ hơn số này, floor() trả về số nguyên lớn nhất không nhỏ hơn số này

```dart
void main() {
    int a = -1;
    int b = 0xDEADBEEF;
    double c = 8e5;

    print(a.abs()); // kết quả là 1
}
```
### các thuộc tính

hashcode - trả về bảng băm

isFinite - trả về true nếu có hạn

```dart
int i = 1000;
print(i.isFinite); // true
```
isNan - true nếu là double hoặc không phải number

isNegative - true nếu là số âm

sign - trả về -1, 0, 1 tùy vào dấu của số

isEven - true nếu số chẵn

isOdd - true nếu số lẻ

## một số methods

abs, ceil, floor

compareTo - so sánh với số khác

remainder - trả về số dư khi chia với số trong remainder

round - làm tròn

toDouble - chuyển sang double

toInt - chuyển sang int

toString - chuyển sang String

truncate - trả về phần nguyên 