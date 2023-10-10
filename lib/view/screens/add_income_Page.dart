import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AddIncomePage extends StatelessWidget {
  const AddIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    return Scaffold(
      backgroundColor: Pallete.expenseBackGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.18,
          ),
          Padding(
            padding: EdgeInsets.only(right: width*0.4),
            child: Text(
              'How much?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03,
                color: const Color.fromARGB(190, 255, 255, 255),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * .21),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: TextFormField(
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Pallete.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.1),
                    topRight: Radius.circular(width * 0.1),
                  )),
                  child: Column(
                    children: [
                    
                    ],
                  ),
            ),
          )
        ],
      ),
    );
  }
}
