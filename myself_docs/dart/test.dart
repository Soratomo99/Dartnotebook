import 'dart:html';

void main() {

}

abstract class A {
  int get value;
}

class B extends A {
  @override
  int get value => throw UnimplementedError();
}

class C {
  int value;
  C(this.value){
    
  }
  int getValue(){
      return value;
    }
}

class D extends C {
  D(int value) : super(value);
  // @override
  // int getValue() {
  //   return super.getValue();
  // }
}