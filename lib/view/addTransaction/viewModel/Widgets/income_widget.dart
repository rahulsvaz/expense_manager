import 'package:expense_manager/view/addTransaction/viewModel/Widgets/date_button.dart';
import 'package:expense_manager/view/addTransaction/viewModel/Widgets/dropDown/drop_down_button.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/home/viewModel/methods/border_decoration_addfielld.dart';
import 'package:expense_manager/view/addTransaction/viewModel/Widgets/attachment_button.dart';
import 'package:expense_manager/view/addTransaction/viewModel/Widgets/howMuch.dart';
import 'package:expense_manager/view/home/viewModel/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.10,
        ),
        HowMuchText(width: width, height: height),
        Padding(
          padding: EdgeInsets.only(left: width * 0.17),
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Pallete.white, fontSize: 80),
            showCursor: true,
            cursorHeight: height * 0.1,
            cursorColor: Pallete.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '₹0',
              hintStyle:
                  TextStyle(fontSize: height * 0.11, color: Pallete.white),
            ),
          ),
        ),
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: width * 0.9,
            decoration: const BoxDecoration(
                color: Pallete.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                const DropDown(),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width * 0.80),
                    child: TextFormField(
                      maxLength: 50,
                      cursorColor: Pallete.grey,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: const TextStyle(color: Pallete.grey),
                        enabledBorder: borderDecoration(),
                        focusedBorder: borderDecoration(),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    AttachmentButton(
                      width: width * 0.55,
                      height: height,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    const DateButton()
                  ]),
                  SizedBox(height: height * 0.03),
                  LoginSignUpButton(
                    onPressed: () {
                      Get.back();
                      Get.snackbar(
                        'Expense Details Added',
                        '',
                      );
                    },
                    label: 'Add Income',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.incomeBackGroundColor,
                  ),
                  SizedBox(
                    height: height * 0.11,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
