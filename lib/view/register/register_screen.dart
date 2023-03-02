import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_banking/di/database_module.dart';
import 'package:mobile_banking/product/enum/widget/button/progress_button_state.dart';
import 'package:mobile_banking/product/enum/widget/text_field/text_field_state.dart';
import 'package:mobile_banking/product/widgets/button/elevated_progress_button.dart';
import 'package:mobile_banking/product/widgets/text_field/custom_outline_text_field.dart';
import 'package:mobile_banking/view/login/login_screen.dart';
import 'package:mobile_banking/view/register/bloc/register_bloc.dart';

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

  Widget get page {
    return BlocProvider(
      create: (context) => RegisterBloc(getIt.get()),
      child: this,
    );
  }

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        var buttonState = ProgressButtonState.calm;
        var inputState = BaseTextFieldState.enabled;
        switch ((state.stateEnum)) {
          case RegisterStateEnum.loading:
            buttonState = ProgressButtonState.loading;
            inputState = BaseTextFieldState.readOnly;
            break;
          case RegisterStateEnum.error:
            buttonState = ProgressButtonState.enabled;
            inputState = BaseTextFieldState.enabled;
            break;
          case RegisterStateEnum.initial:
            buttonState = ProgressButtonState.calm;
            break;
          case RegisterStateEnum.success:

            buttonState = ProgressButtonState.enabled;
            break;
          case RegisterStateEnum.message:
            buttonState = ProgressButtonState.enabled;
            break;
          case RegisterStateEnum.noInternet:
            buttonState = ProgressButtonState.enabled;
            break;
        }

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
                        state: inputState,
                        label: "First name",
                        hint: "First name",
                        inputType: TextInputType.text,
                        maxLength: 20),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomOutlineTextField(
                    textFieldState: BaseTextField(
                        controller: phoneController,
                        state: inputState,
                        label: "Last name",
                        hint: "Last name",
                        inputType: TextInputType.text,
                        maxLength: 20),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomOutlineTextField(
                    textFieldState: BaseTextField(
                      controller: phoneController,
                      state: inputState,
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
                      state: inputState,
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
                    state: buttonState,
                    buttonText: "Register",
                    callback: () {
                      context.read<RegisterBloc>().add(
                            RegisterClick(
                              firstNameController.text,
                              lastNameController.text,
                              phoneController.text,
                              passwordController.text,
                            ),
                          );
                    },
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen().page,
                              ));
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
      },
    );
  }
}
