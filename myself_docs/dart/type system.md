# Dart type system

Dart là ngôn ngữ static (như Swift và Kotlin) khác với dynamic như Javascript và Python

## Điểm khác biệt lớn giữa static và dynamic language là: 

static: types được kiểm tra trong quá trình compile

dynamic: types được kiểm tra trong quá trình execution (runtime)

có nghĩa là trong quá trình code dart, hệ thống sẽ kiểm tra lỗi chứ không đợi tới lúc thực thi lệnh

```dart
void main() {
    int a = "name"; // báo lỗi và không cho thực thi
    print(a.toUpperCase()); // báo lỗi và không cho thực thi
}
```

## Quá trình từ code sang thực thi hoàn toàn

Source code --> Compile --> (ARM / x86 / web) --> Runtime --> Output