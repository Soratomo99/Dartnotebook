# The basic of Dart

có 2 hàm dựng sẵn của dart là main() và printInteger(), cả 2 hàm này đều trả về void

```dart
void main(){
  int i = 1;
  //this is printInteger()
  print(i);

  //out put: 1
}
```
cách comment trong dart là sử dụng dấu // cho 1 dòng, /* */ cho nhiều dòng

comment document bằng cách sử dụng /// cho 1 dòng hoặc /** */ cho nhiều dòng, lời giải thích document cần đặt trước thứ cần giải thích

gọi hàm, class, ... khác trong document bằng cách để tên của hàm, class, ... đó vào dấu []

```dart
/// đây là hàm in ra dòng chữ test
void test(){
    print("test");
}
/** đây là cách viết comment document, rê chuột vào đây để coi giải thích hàm [test] */
void functionTest(){
    print("testing");
}
```