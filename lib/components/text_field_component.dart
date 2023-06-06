import 'package:flutter/material.dart';
import 'package:gli_check/configs/color_constants.dart';

class TextFieldComponent extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final validator;

  const TextFieldComponent({
    Key? key,
    required this.controller,
    required this.hintText,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.tintLightGrey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.tintMidGrey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          fillColor: ColorConstants.tintLightGrey,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorConstants.tintMidGrey,
          ),
        ),
      ),
    );
  }
}
