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