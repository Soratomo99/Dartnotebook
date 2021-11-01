void main() {
  List<int?> listInt = [0, 1, 2, null];
  for(var item in listInt){
    if(item != null)
      print(item);
  }
}