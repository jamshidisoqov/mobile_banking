import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_banking/product/enum/widget/button/progress_button_state.dart';
import 'package:mobile_banking/product/enum/widget/text_field/text_field_state.dart';
import 'package:mobile_banking/product/widgets/button/elevated_progress_button.dart';
import 'package:mobile_banking/product/widgets/text_field/custom_outline_text_field.dart';

class RegisterScreen extends StatelessWidget {


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final maskedText = MaskTextInputFormatter(
    mask: "## ### ## ##",
    filter: {
      "#": RegExp(r"\d"),
    },
  );

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const SizedBox(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            customBorder: const CircleBorder(),
            splashColor: Colors.grey.shade700,
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign up user",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomOutlineTextField(
                textFieldState: BaseTextField(
                  controller: firstNameController,
                  state: BaseTextFieldState.enabled,
                  label: "First name",
                  hint: "First name",
                  inputType: TextInputType.text,
                  maxLength: 20
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: double.infinity,
              child: CustomOutlineTextField(
                textFieldState: BaseTextField(
                  controller: phoneController,
                  state: BaseTextFieldState.enabled,
                  label: "Last name",
                  hint: "Last name",
                  inputType: TextInputType.text,
                  maxLength: 20
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: double.infinity,
              child: CustomOutlineTextField(
                textFieldState: BaseTextField(
                  controller: phoneController,
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
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomOutlineTextField(
                textFieldState: BaseTextField(
                  controller: passwordController,
                  state: BaseTextFieldState.enabled,
                  label: "Password",
                  inputType: TextInputType.visiblePassword,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedProgressButton(
                state: ProgressButtonState.enabled,
                buttonText: "Register",
                callback: () {},
              ),
            ),
            const Spacer(),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already register yet?"),
                  InkWell(
                    onTap: () {

                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
