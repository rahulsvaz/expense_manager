import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:flutter/material.dart';

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.95,
      height: height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.lightGrey),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.attach_file,
              color: Pallete.grey,
            ),
            SizedBox(
              width: width * 0.04,
            ),
            const Text(
              'Add Attachment',
              style: TextStyle(color: Pallete.grey),
            )
          ]),
    );
  }
}
