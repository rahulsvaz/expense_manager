import 'package:expense_manager/viewModel/constants/colors.dart/colors.dart';
import 'package:flutter/material.dart';

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
      required this.backgroundColor
      
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(320, 55),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: buttonTextColor),
        ));
  }
}
