import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:flutter/material.dart';
  BoxDecoration homeScreenContainerDecoration() {
    return const BoxDecoration(
              gradient:Pallete.gradient1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)));
  }