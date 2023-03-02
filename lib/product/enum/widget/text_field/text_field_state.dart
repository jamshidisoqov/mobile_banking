import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BaseTextFieldState { enabled, disabled, readOnly, error }

class BaseTextField {
  String? error;
  String? hint;
  String? helperText;
  String label;

  TextEditingController controller;
  TextInputType inputType;
  Widget? leading;
  BaseTextFieldState state;
  int? maxLength;
  List<TextInputFormatter>? formatter;

  BaseTextField(
      {required this.controller,
      required this.label,
      this.maxLength,
      this.leading,
      this.error,
      this.hint,
      this.helperText,
      this.formatter,
      this.inputType = TextInputType.text,
      this.state = BaseTextFieldState.enabled});
}
