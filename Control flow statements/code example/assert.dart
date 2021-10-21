void main() {

  // kiểm tra nullable
  String? text;
  assert(text != null, "biến text có thể null");

  String urlString = "link";
  assert(urlString.startsWith('https'),
    'URL ($urlString) should start with "https".');
}