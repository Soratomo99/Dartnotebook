##  Single responsibility principle

Một class chỉ nên giữ 1 trách nhiệm duy nhất ( Chỉ có thể sửa đổi class với 1 lý do duy nhất ).

```dart
class ReportManager
{
   void ReadDataFromDB(){};
   void ProcessData(){};
   void PrintReport(){};
}

//to
class ReportManager {
    ReadDataFromDB read;
    ProcessData process;
    PrintReport printReport;
    ReportManager(this.read, this.process, this.printReport);
}
class ReadDataFromDB{}
class ProcessData{}
class PrintReport{}
```

```dart
class Result
{
  checkResult(int rollno)
  {
    bool isRollnoValidate = isRollnovalidate();
    if(isRollnoValidate)
    {
      ResultModel resultModel = searchResult();
      showResult(resultModel);
    }
    else{
      return "Invalid rollno";
    }
  }
  isRollnovalidate()
  {
    return true;
  }
// get request
  searchResult()
  {
    // return result;
  }
//painting
 showResult(ResultModel model)
  {
    // show result in pleasant way 
  }
}
class ResultModel
{
}
```
after

```dart
class Result {
  checkResult(int rollno) {
    bool isRollnoValidate = Validate().isRollnovalidate();
    if (isRollnoValidate) {
      ResultModel resultModel = NetworkApi().searchResult();
      Printing().showResult(resultModel);
    } else {
      return "Invalid rollno";
    }
  }
}

class Validate {
  // this is responsible for validate
  isRollnovalidate() {
    return true;
  }
}

class ResultModel {}

class Printing {
  // this class is responsible for printing
  showResult(ResultModel model) {
    // show result in pleasant way
  }
}

class NetworkApi {
  // this class is responsible for fetching result
  searchResult() {
    return ResultModel();
  }
}
```
Class này giữ tới 3 trách nhiệm: Đọc dữ liệu từ DB, xử lý dữ liệu, in kết quả. Do đó, chỉ cần ta thay đổi DB, thay đổi cách xuất kết quả, … ta sẽ phải sửa đổi class này. Càng về sau class sẽ càng phình to ra. Theo đúng nguyên lý, ta phải tách class này ra làm 3 class riêng. Tuy số lượng class nhiều hơn những việc sửa chữa sẽ đơn giản hơn, class ngắn hơn nên cũng ít bug hơn.

## Open/closed principle

Có thể thoải mái mở rộng 1 class, nhưng không được sửa đổi bên trong class đó ( open for extension but closed for modification ).

```dart
cclass Result
{
  mechanicalCheckResult()
  {
    // some code 
  }
  civilCheckResult()
  {
    // some code 
  }
}
```
after

```dart
abstract class Result {
  checkResult();
}

class ComputerScience implements Result {
  @override
  checkResult() {
    // some code
  }
}

class Civil implements Result {
  @override
  checkResult() {
    // some code
  }
}

class Mechanical implements Result {
  @override
  checkResult() {
    // some code
  }
}
```

Theo nguyên lý này, mỗi khi ta muốn thêm chức năng,.. cho chương trình, chúng ta nên viết class mới mở rộng class cũ ( bằng cách kế thừa hoặc sở hữu class cũ) không nên sửa đổi class cũ.

## Liskov Substitution Principle

Trong một chương trình, các object của class con có thể thay thế class cha mà không làm thay đổi tính đúng đắn của chương trình.

```dart
abstract class Result {
  checkResult();
  codingTestResult();
}
class MechanicalBranch extends Result {
  @override
  checkResult() {
    //  some code
  }
  /*
  * Here it  is logically incorrect
  * */
  @override
  codingTestResult() {
    //  some code
  }
}
class ComputerScienceBranch extends Result {
  @override
  checkResult() {
    //  some codet
  }
  @override
  codingTestResult() {
    //  some code
  }
}
```
after

```dart
abstract class OfflineResult {
  checkResult();
}
abstract class CodingResult {
  codingTestResult();
}
class MechanicalBranch implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}
class ComputerScienceBranch implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }
  @override
  codingTestResult() {
    // somecode
  }
}
```

Hãy tưởng tượng bạn có 1 class cha tên Vịt. Các class VịtBầu, VịtXiêm có thể kế thừa class này, chương trình chạy bình thường. Tuy nhiên nếu ta viết class VịtChạyPin, cần pin mới chạy được. Khi class này kế thừa class Vịt, vì không có pin không chạy được, sẽ gây lỗi. Đó là 1 trường hợp vi phạm nguyên lý này.

## Interface Segregation Principle

Thay vì dùng 1 interface lớn, ta nên tách thành nhiều interface nhỏ, với nhiều mục đích cụ thể.

```dart
abstract class Result {
  checkResult();
  codingTestResult();
}
class MechanicalBranch implements Result {
  @override
  checkResult() {
    //  some code
  }
  /*
  * Here we exposed client with the method which none of his              *  business
  * */
  @override
  codingTestResult() {
    //  some code
  }
}
class ComputerScienceBranch implements Result {
  @override
  checkResult() {
    //  some codet
  }
  @override
  codingTestResult() {
    //  some code
  }
}
```
after

```dart
abstract class OfflineResult {
  checkResult();
}

abstract class CodingResult {
  codingTestResult();
}

class MechanicalBranch implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}

class ComputerScienceBranch implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }

  @override
  codingTestResult() {
    // somecode
  }
}
```

Hãy tưởng tượng chúng ta có 1 interface lớn, khoảng 100 methods. Việc implements sẽ khá cực khổ, ngoài ra còn có thể dư thừa vì 1 class không cần dùng hết 100 method. Khi tách interface ra thành nhiều interface nhỏ, gồm các method liên quan tới nhau, việc implement và quản lý sẽ dễ hơn.

## Dependency inversion principle

```dart
abstract class Payment {
 payment();
}

class PaymentViaCreditCard implements Payment
{
  @override
  payment() {
   // some code
  }
   }
class PaymentViaDebitCard implements Payment
{
  @override
  payment() {
   // some code
  }  
}
class PaymentViaBhimUPI implements Payment
{
  @override
  payment() {
   // some code
  } 
}

class Checkout
{
  // our checkout class knows nothing about how payment works 
  // its knows pay.payment() is paying method 
  checkOut(Payment pay)
  {
    pay.payment();
  }
}
```

1. Các module cấp cao không nên phụ thuộc vào các modules cấp thấp. 
   Cả 2 nên phụ thuộc vào abstraction.
2. Interface (abstraction) không nên phụ thuộc vào chi tiết, mà ngược lại.
( Các class giao tiếp với nhau thông qua interface, 
không phải thông qua implementation.)

Chúng ta đều biết 2 loại đèn: đèn tròn và đèn huỳnh quang. Chúng cùng có đuôi tròn, do đó ta có thể thay thế đèn tròn bằng đèn huỳnh quanh cho nhau 1 cách dễ dàng.

Ở đây, interface chính là đuôi tròn, implementation là bóng đèn tròn và bóng đèn huỳnh quang. Ta có thể swap dễ dàng giữa 2 loại bóng vì ổ điện chỉ quan tâm tới interface (đuôi tròn), không quan tâm tới implementation.

Như để kết nối tới database, ta chỉ cần gọi hàm Get, Save … của Interface IDataAccess. Khi thay database, ta chỉ cần thay implementation của interface này.