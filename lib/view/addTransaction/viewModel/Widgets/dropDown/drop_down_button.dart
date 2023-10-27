import 'package:expense_manager/view/addTransaction/viewModel/Widgets/dropDown/drop_down_controller.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/model/transaction_model.dart';
import 'package:get/get.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final dropDownController = Get.put(
      DropDownController(),
    );
    //Category selectedCategory = Category.bills;
    return Container(
      width: width * 0.80,
      height: height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.lightGrey),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Center(
        child: DropdownButton(
          underline: const Text(''),
          value: dropDownController.selectedCategory,
          items: Category.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase(),
                    style: const TextStyle(color: Pallete.grey),
                  ),
                ),
              ).toList(),
          onChanged: (value) {
            if (value != null) {
              dropDownController.selectedCategory = value;
            }
          },
        ),
      ),
    );
  }
}
