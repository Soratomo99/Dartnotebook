# while và do - while

```dart
void main() {
  bool check = true;
  while(check) {
    print("check is true");
    break;
  }
  
  int i = 0;
  while(i < 3) {
    print(i);
    i++;
  }

  do {
    i--;
    print(i);
  } while (i > 0);
}
```