void main() {
  final Map nene = {
    "name" : "Nene Amano",
    "isVtuber": true
  };
  final Map neneCopy = nene;
  neneCopy["isVtuber"] = false;
  print(nene);
  print(neneCopy);
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: false}
  final Map theTrueNene = {...nene};
  theTrueNene["isVtuber"] = true;
  print(nene);
  print(neneCopy);
  print(theTrueNene);
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: false}
  // {name: Nene Amano, isVtuber: true}
}