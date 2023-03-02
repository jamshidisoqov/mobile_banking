import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_banking/core/data/api/auth/auth_api.dart';
import 'package:mobile_banking/core/data/prefs/app_shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDatabase() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerSingleton<AppSharedPrefs>(AppSharedPrefs(getIt.get()));

  //DIO
  getIt.registerSingleton(
      Dio(BaseOptions(baseUrl: "http://206.189.128.74/api")));
  //api
  getIt.registerLazySingleton(() => AuthApi(getIt.get()));

}
