# Break và continue

break dùng để kết thúc hoàn toàn (ngưng) vòng lặp

continue dùng để skip (bỏ qua) bước lặp hiện chứa continue

```dart
void main() {
  List<int> listInt = [];

  while(listInt.length < 10) {
    print(listInt.length);
    listInt.add(listInt.length);
    if(listInt.length == 6) break;
  }

  for(int i = 0; i < 5; i++){
    if(i == 3) continue;
    listInt[i] = i + 5;
    print(listInt[i]);
  }

  //sử dụng thứ có thể lặp được như list hoặc set
  listInt.where((element) => element < 3).forEach((element) {print(element);});
}
```