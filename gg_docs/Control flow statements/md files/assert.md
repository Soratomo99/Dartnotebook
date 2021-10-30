# Assert

assert dùng để kiểm tra và xuất ra message cần thiết

sau khi xuất thông báo sẽ break toàn bộ

cách ví dụ run: dart run --enable-asserts assert.dart

```dart
void main() {

  // kiểm tra nullable
  String? text;
  assert(text != null, "biến text có thể null");

  String urlString = "link";
  assert(urlString.startsWith('https'),
    'URL ($urlString) should start with "https".');
}
```
nếu thay text != null là text == null thì sẽ chạy tới assert thứ 2 trong ví dụ