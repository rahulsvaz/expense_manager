
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';

TextStyle appBartTextStyle() => const TextStyle(color: Colors.black);

TextStyle haveAccountStyle() => const TextStyle(color: Pallete.grey);

  TextStyle backToLoginStyle() {
    return const TextStyle(
                    color: Pallete.purple, fontWeight: FontWeight.bold);
  }


  TextStyle forgotPasswordStyle() {
    return const TextStyle(fontSize: 17,
                    fontWeight: FontWeight.bold, color: Pallete.purple);
  }