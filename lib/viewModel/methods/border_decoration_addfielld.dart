import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
  OutlineInputBorder borderDecoration() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        borderSide: BorderSide(
          color: Pallete.lightGrey,
        ));
  }