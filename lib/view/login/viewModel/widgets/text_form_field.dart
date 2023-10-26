
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class UserTextfield extends StatelessWidget {
  final String? label;
  final bool obscureText;
  final IconButton? surffix;
  final String? Function(String?)? validator;

  const UserTextfield(
      {super.key,
      this.label,
      required this.obscureText,
      this.surffix,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      width: Get.width * 0.79,
      
      child: TextFormField(
        validator: validator,
        style: const TextStyle(color: Pallete.textFieldColor),
        obscureText: obscureText,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            suffixIcon: surffix,
            label: Text(
              label.toString(),
              style: const TextStyle(color: Pallete.hintTextColor),
            ),
            focusedErrorBorder: borderDecoration(),
            errorBorder: borderDecoration(),
            enabledBorder: borderDecoration(),
            focusedBorder: borderDecoration()),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide(width: 1, color: Pallete.textfieldBorderColor),
    );
  }
}
