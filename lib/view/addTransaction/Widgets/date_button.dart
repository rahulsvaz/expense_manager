import 'package:expense_manager/viewModel/addTransaction/date_controller.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateButton extends StatelessWidget {
  const DateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dateController = Get.put(DateController());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.30,
      height: height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.lightGrey),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GetBuilder<DateController>(
            builder: (controller) {
              return Text(
                controller.formattedDate,
                style: TextStyle(fontSize: width * 0.03),
              );
            },
          ),
          IconButton(
            onPressed: () {
              dateController.showPresentDatePicker(context);
            },
            icon: const Icon(
              Icons.calendar_month,
              color: Pallete.grey,
            ),
          )
        ],
      ),
      // child: const Text('Date'),
    );
  }
}
