# If và else 

trong ngoặc tròn của if, else sẽ chứa so sánh trả kết quả về bool, nếu true sẽ thực hiện hàm.

```dart
void main() {
  bool check = true;

  // cách 1
  if (check == true){
    print("true");
  } else {
    print("false");
  }

  check = false;
  //cách 2
  if(!check) {
    print("check is false");
  } 

  //cách 3
  int i = 0;
  if(i < 3) {
    i++;
  } else {
    i = 0;
  }

  if(i < 3) {
    i++;
  } else if(!check) {
    i = 0;
  }
}
```

trong ví dụ này, tại cách 2 nếu viết tiếp tục else mà không có so sánh khác biến check, dart sẽ báo lỗi vì đã biết chắc chắn hàm if bên trên trả kết quả, hàm else lúc này không thực thi