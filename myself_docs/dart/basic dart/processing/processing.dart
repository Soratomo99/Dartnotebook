import 'dart:io';

void main(List<String> arguments) {
  if(arguments.isEmpty) {
    print("Usage: dart processing.dart <inputFile.csv>");
    exit(1); // 0 is success, 1 is error
  }
  final String inputFile = arguments.first;
  print(inputFile);
  final lines = File(inputFile).readAsLinesSync();
  final ageByGender = <String, int>{};
  lines.removeAt(0); // delete line: Name Age Gender - the header
  for (var line in lines) {
    final values = line.split(',');
    final ageString = values[1].replaceAll("", '');
    final age = int.parse(ageString);
    final gender = values[2].replaceAll("", '');
    final previousGender = ageByGender[gender];
    if(previousGender == null){
      ageByGender[gender] = age;
    }else {
      ageByGender[gender] = previousGender + age;
    }
    //print(line);
  }
  for (var entry in ageByGender.entries) {
    final ageFormatted = entry.value.toStringAsFixed(1);
    final gender = entry.key == '' ? "Unallocated" : entry.key;
    print("${gender} : ${ageFormatted}");
  }
}