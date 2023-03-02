import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_banking/di/database_module.dart';
import 'package:mobile_banking/product/enum/widget/button/progress_button_state.dart';
import 'package:mobile_banking/product/enum/widget/text_field/text_field_state.dart';
import 'package:mobile_banking/product/widgets/button/elevated_progress_button.dart';
import 'package:mobile_banking/product/widgets/text_field/custom_outline_text_field.dart';
import 'package:mobile_banking/view/login/login_screen.dart';
import 'package:mobile_banking/view/splash/splash_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();

  final maskedText = MaskTextInputFormatter(
    mask: "## ### ## ##",
    filter: {
      "#": RegExp(r"\d"),
    },
  );

  int currentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        focusColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      home: SafeArea(
        top: true,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomOutlineTextField(
                      textFieldState: BaseTextField(
                        controller: controller,
                        state: BaseTextFieldState.enabled,
                        label: "Phone number",
                        hint: "## ### ## ##",
                        leading: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "+998",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        inputType: TextInputType.phone,
                        formatter: [
                          maskedText,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedProgressButton(
                      state: ProgressButtonState.enabled,
                      buttonText: "Login",
                      callback: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: PinFieldAutoFill(
                      decoration: BoxLooseDecoration(
                        radius: const Radius.circular(8),
                        strokeWidth: 2,
                        strokeColorBuilder: PinListenColorBuilder(
                          Colors.blue,
                          Colors.grey,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 12,
              selectedFontSize: 12,
              currentIndex: currentIndex,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.sync_alt_outlined),
                  label: "Transfer",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_outlined),
                  label: "Payment",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                  ),
                  label: "",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "Monitoring",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
