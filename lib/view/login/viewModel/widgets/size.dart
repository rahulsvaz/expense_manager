import 'package:flutter/material.dart';
class Height003 extends StatelessWidget {
  const Height003({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.03,
    );
  }
}
