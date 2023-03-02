import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  static const String isVerify = "isVerify";

  final SharedPreferences sharedPreferences;

  AppSharedPrefs(this.sharedPreferences);

  Future<void> setIsVerify(bool verify) async {
    await sharedPreferences.setBool(isVerify, verify);
    return;
  }

  bool getIsVerify() {
    return sharedPreferences.getBool(isVerify) ?? false;
  }




}
