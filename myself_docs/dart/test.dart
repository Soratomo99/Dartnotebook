void main() {
  const emails = [
    'abc@abc.com',
    'abc@gmail.com',
    'abc@gmail.vn',
    'abc@gmail.uk',
  ];
  const accessDomain = ['gmail.com', 'gmail.vn'];

  final unaccessDomain = emails.map((e) => e.split('@').last).where((element) => !accessDomain.contains(element));
  print(unaccessDomain);

  final unaccess = getUnaccessDomain(emails, accessDomain);
  print(unaccess);

  final unaccess2 = getUnaccessDomain2(emails, accessDomain);
  print(unaccess2);

  // abc.com, gmail.uk
} 

Iterable<String> getUnaccessDomain(List<String> emails, List<String> accessDomain){
  return emails.map((e) => e.split('@').last).where((element) => !accessDomain.contains(element));
}

Iterable<String> getUnaccessDomain2(List<String> emails, List<String> accessDomain){
  var result = <String>[];
  for(var email in emails){
    final domain = email.split('@').last;
    if(!accessDomain.contains(domain)){
      result.add(domain);
    }
  }
  return result;
}