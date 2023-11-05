import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/viewModel/addTransaction/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final attachment = Get.put(PickImageController());
    return Container(
      width: width * 0.95,
      height: height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.lightGrey),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.attach_file,
          color: Pallete.grey,
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Obx(() =>Text( attachment.imagePath.isEmpty?
          'Add Image':'Change Image',
          style: const TextStyle(color: Pallete.grey),
        ) )


           
      ]),
    );
  }
}
