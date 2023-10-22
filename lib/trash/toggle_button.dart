import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class ToggleButton extends StatelessWidget {
  ToggleButton({super.key, required this.changeWidget, required this.value});
  bool value = false;
  final void Function() changeWidget;

  @override
  Widget build(BuildContext context) {
    return SlidingSwitch(
      value: false,
      width: 250,
      onChanged: (v) {
        if (value != true) {
          value = true;
        } else {
          value = false;
        }
      },
      height: 55,
      animationDuration: const Duration(milliseconds: 400),
      onDoubleTap: () {},
      onTap: () {},
      onSwipe: changeWidget,
      textOff: "Expense",
      textOn: "Income",
      contentSize: 17,
      colorOn: Pallete.incomeBackGroundColor,
      colorOff: Pallete.expenseBackGroundColor,
      background: Pallete.purple,
      buttonColor: const Color(0xfff7f5f7),
      inactiveColor: Pallete.white,
    );
  }
}
