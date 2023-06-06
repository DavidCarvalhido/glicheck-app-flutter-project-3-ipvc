import 'package:flutter/material.dart';
import 'package:gli_check/configs/color_constants.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? onTap;

  const ButtonComponent({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.tintBlack,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: ColorConstants.tintLightGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
