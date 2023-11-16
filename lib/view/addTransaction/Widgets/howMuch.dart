import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';

class HowMuchText extends StatelessWidget {
  const HowMuchText({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.4),
      child: Text(
        'How much?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: height * 0.03,
       color: Pallete.grey
              ),
      ),
    );
  }
}


