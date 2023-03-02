import 'package:flutter/material.dart';
import 'package:mobile_banking/product/enum/widget/text_field/text_field_state.dart';

class CustomOutlineTextField extends StatelessWidget {
  final BaseTextField textFieldState;

  const CustomOutlineTextField({required this.textFieldState, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: textFieldState.maxLength,
      decoration: InputDecoration(
        hintText: textFieldState.hint,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: Colors.blue,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        prefix: textFieldState.leading,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: Text(
          textFieldState.label,
        ),
        errorText: textFieldState.state == BaseTextFieldState.error
            ? textFieldState.error
            : null,
        helperText: textFieldState.helperText,
      ),
      inputFormatters: textFieldState.formatter,
      controller: textFieldState.controller,
      keyboardType: textFieldState.inputType,
      textInputAction: TextInputAction.done,
      readOnly: textFieldState.state == BaseTextFieldState.readOnly,
    );
  }
}
