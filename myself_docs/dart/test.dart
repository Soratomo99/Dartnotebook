void main(){
  var a = A("name") ..changeToDefault();
  //var a = A("name"); a.changeToDefault();
  print(a.name);
}

class A {
  String name;
  A(this.name);
  void changeToDefault() {
    this.name = "defalut value";
  }
}