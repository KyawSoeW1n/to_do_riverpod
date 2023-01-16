import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String errorText;
  final TextEditingController textEditingController;

  const TextFormFieldWidget(
      this.hintText, this.labelText, this.errorText, this.textEditingController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
