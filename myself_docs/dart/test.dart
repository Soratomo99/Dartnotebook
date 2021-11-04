class IntNotNegative{
  final int value;
  IntNotNegative(this.value) : assert(value > 0, "Value can not be negative");
}

void main(){
  IntNotNegative value = IntNotNegative(1);
  IntNotNegative value2 = IntNotNegative(-1); // message: Value can not be negative
}