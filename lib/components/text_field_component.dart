import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  final validator;

  const TextFieldComponent({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
