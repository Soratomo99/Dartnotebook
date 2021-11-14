## Cấu trúc thư mục

&emsp; Quan tâm đến folder "lib" và file "pubspec.yaml" vì đối với Flutter cơ bản, đây là nơi lập trình và quản lý các dependencies. Trong lib, main.dart phải tồn tại, đây là file mà Flutter sẽ truy xuất vào đầu tiên.

```
my_app
    android
    ...
    ios
    ...
    lib
        main.dart
    test
        unit_test.dart
        widget_test.dart
    pubspec.lock
    pubspec.yaml
    README.md
  ...
```

## Life circle Flutter

![life_circle_flutter](/images/life_circle_flutter.png)

&emsp; Các widget Flutter khi xây dựng phải được mở rộng từ một số lớp trong thư viện Flutter. Hai loại (class) bạn hầu như luôn luôn sử dụng là StatlessWidget và StatefulWidget. Sự khác biệt giữa hai loại này là StatefulWidget có một thể hiện trạng thái trong Widget và một số phương thức được xây dựng để bảo Flutter re-render lại nếu trạng thái đó thay đổi.

BuildContext, định nghĩa đơn giản nhất thì nó xác định và điều khiển vị trí của một widget trong cây widget..

State, nơi lưu trữ trạng thái, các nội dung cần xây dựng.

Khái niệm state trong Flutter thể hiện qua :

&emsp; - Dữ liệu được sử dụng bởi các widget có thể thay đổi.

&emsp; - Dữ liệu không thể đọc đồng bộ khi widget đã được xây dựng. (Tất cả state phải được thiết lập cùng với thời điểm phương thức build được gọi).

Vòng đời sẽ trãi qua các bước:
1. createState()
2. mounted == true
3. initState()
4. didChangeDependencies()
5. build()
6. didUpdateWidget()
7. setState()
8. deactivate()
9. dispose()
10. mounted == false

### Constructor

This function is not part of the life cycle, because this time the State of the widget property is empty, if you want to access the widget properties in the constructor will not work. But the constructor must be to the first call.

### createState()

When the Framework is instructed to build a StatefulWidget, it immediately calls createState()

### mounted is true

When createState creates your state class, a buildContext is assigned to that state. buildContext is, overly simplified, the place in the widget tree in which this widget is placed. Here's a longer explanation. All widgets have a bool this.mounted property. It is turned true when the buildContext is assigned. It is an error to call setState when a widget is unmounted.

### initState()

This is the first method called when the widget is created (after the class constructor, of course.) initState is called once and only once. It must call super.initState().

### didChangeDependencies()

This method is called immediately after initState on the first time the widget is built.

### build()

This method is called often. It is required, and it must return a Widget.

### didUpdateWidget(Widget oldWidget)

If the parent widget changes and has to rebuild this widget (because it needs to give it different data), but it's being rebuilt with the same runtimeType, then this method is called. This is because Flutter is re-using the state, which is long lived. In this case, you may want to initialize some data again, as you would in initState

### setState()

This method is called often from the framework itself and from the developer. Its used to notify the framework that data has changed

### deactivate()

Deactivate is called when State is removed from the tree, but it might be reinserted before the current frame change is finished. This method exists basically because State objects can be moved from one point in a tree to another.

### dispose()

dispose() is called when the State object is removed, which is permanent. This method is where you should unsubscribe and cancel all animations, streams, etc.

### mounted is false

The state object can never remount, and error will be thrown if setState is called.