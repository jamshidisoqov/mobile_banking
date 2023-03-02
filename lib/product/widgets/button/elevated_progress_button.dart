import 'package:flutter/material.dart';
import 'package:mobile_banking/product/enum/widget/button/progress_button_state.dart';

class ElevatedProgressButton extends StatelessWidget {
  final ProgressButtonState state;

  final VoidCallback callback;

  final String buttonText;

  const ElevatedProgressButton({
    required this.state,
    this.buttonText = "",
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ProgressButtonState.calm:
        return IgnorePointer(
          child: ElevatedButton(
            onPressed: callback,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ),
        );
      case ProgressButtonState.enabled:
        return ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
        );
      case ProgressButtonState.loading:
        return IgnorePointer(
          child: ElevatedButton(
            onPressed: callback,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
    }
  }
}
