import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginSignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color buttonTextColor;
  final Color backgroundColor;
  const LoginSignUpButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.buttonTextColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize:  Size(Get.width*0.79
        , Get.height*0.07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: buttonTextColor),
      ),
    );
  }
}
