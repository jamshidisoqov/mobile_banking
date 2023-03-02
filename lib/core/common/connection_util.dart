import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
}
