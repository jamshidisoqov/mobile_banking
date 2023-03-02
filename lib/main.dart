import 'package:flutter/material.dart';
import 'package:mobile_banking/di/database_module.dart';
import 'package:mobile_banking/view/register/verify/register_verify_screen.dart';
import 'package:mobile_banking/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDatabase();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        focusColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      home: const SplashScreen().page,
    ),
  );
}
