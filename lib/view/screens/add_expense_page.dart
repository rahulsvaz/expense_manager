import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/border_decoration_addfielld.dart';
import 'package:expense_manager/viewModel/widgets/attachment_button.dart';
import 'package:expense_manager/viewModel/widgets/howMuch.dart';
import 'package:expense_manager/viewModel/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [Container(),Container()];
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      backgroundColor: Pallete.expenseBackGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.18,
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
          Expanded(
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Pallete.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                   
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width * 0.95),
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
                    SizedBox(height: height * 0.02),
                    AttachmentButton(width: width, height: height),
                    SizedBox(height: height * 0.07),
                    LoginSignUpButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          'Expense Details Added',
                          '',
                        );
                      },
                      label: 'Continue',
                      buttonTextColor: Pallete.white,
                      backgroundColor: Pallete.purple,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
