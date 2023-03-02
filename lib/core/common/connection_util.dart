import 'dart:io';

Future<bool> hasConnection() async {
  bool connection;
  try {
    var result = await InternetAddress.lookup("https://www.google.com/");
    connection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (e) {
    connection = false;
  }
  return connection;
}
