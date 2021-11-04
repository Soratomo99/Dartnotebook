class Fraction{
  final int numerator;
  final int denominator;
  Fraction(this.numerator, this.denominator){
    if(denominator == 0){
      throw IntegerDivisionByZeroException();
    }
  }
  double get value => numerator / denominator;
}
void testFraction(){
  try {
    final test = Fraction(1, 0);
    print(test.value);
  } on IntegerDivisionByZeroException catch (e) {
    print(e);
    rethrow;
  } on Exception catch(e) {
    print(e);
  } finally {
    print("test done");
  }
}
void main(){
  testFraction(); 
  // IntegerDivisionByZeroException
  // test done
}