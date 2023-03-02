import 'package:flutter/material.dart';
import 'package:mobile_banking/product/enum/widget/button/progress_button_state.dart';
import 'package:mobile_banking/product/widgets/button/elevated_progress_button.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegisterVerifyScreen extends StatelessWidget {
  const RegisterVerifyScreen({Key? key}) : super(key: key);

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
              "Enter end verification\ncode",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: PinFieldAutoFill(
                  decoration: BoxLooseDecoration(
                    radius: const Radius.circular(8),
                    gapSpace: 10,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
            const SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedProgressButton(
                state: ProgressButtonState.enabled,
                buttonText: "Submit",
                callback: () {},
              ),
            ),
            const Spacer(),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Code expired date:"),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "02:00",
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
            ),
          ],
        ),
      ),
    );
  }
}
