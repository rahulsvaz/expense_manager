import 'dart:io';
import 'package:expense_manager/view/editTransaction/edit_transaction.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/viewImage/image_view.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatelessWidget {
  final int index;
  final String amount;
  final String imagePath;
  final String description;
  final String dateAndTime;
  final String type;
  final String category;
  const TransactionDetails(
      {required this.index,
      required this.type,
      required this.amount,
      required this.category,
      required this.imagePath,
      required this.dateAndTime,
      required this.description,
      super.key});


  @override

  Widget build(BuildContext context) {
    final transaction = Get.put(HomeScreenControllers());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              child: Container(
                width: width,
                height: height * 0.4,
                decoration: BoxDecoration(
                  color: type == 'expense'
                      ? Pallete.expenseBackGroundColor
                      : Pallete.incomeBackGroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * 0.1),
                    bottomRight: Radius.circular(width * 0.1),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.05,
              child: SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Pallete.white,
                        )),
                    Text(
                      'Transaction Details',
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          transaction.deleteTransaction(context, index);
                          Get.back();
                        },
                        child: Image.asset('assets/images/trash.png'))
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.14,
              child: Text(
                amount,
                style: TextStyle(
                    color: Pallete.white,
                    fontSize: height * 0.07,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: height * 0.23,
              child: Text(
                category.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.white,
                  fontSize: height * 0.02,
                ),
              ),
            ),
            Positioned(
              top: height * .27,
              child: Text(
                dateAndTime,
                style: TextStyle(
                  color: Pallete.white,
                  fontSize: height * 0.02,
                ),
              ),
            ),
            Positioned(
              top: height * .45,
              left: width * 0.09,
              child: Text(
                description,
                style: TextStyle(fontSize: height * 0.023, color: Pallete.grey),
              ),
            ),
            Positioned(
              top: height * .50,
              child: imagePath.isEmpty
                  ? const Text(
                      'No Attachment Found',
                      style: TextStyle(color: Pallete.grey),
                    )
                  : SizedBox(
                      height: height * .50,
                      width: width * .50,
                      child: GestureDetector(
                          onTap: () {
                            Get.to(ImageViewer(imagePath: imagePath));
                          },
                          child: Image.file(File(imagePath)))),
            ),
            Positioned(
              top: height * .90,
              child: SwipeButton.expand(
                width: width * 0.7,
                height: height * 0.07,
                borderRadius: BorderRadius.circular(20),
                thumb: const Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white,
                ),
                activeThumbColor: Pallete.purple,
                activeTrackColor: Colors.grey.shade300,
                onSwipe: () {
                  Get.to(const EditTransactionPage());
                },
                child: const Text(
                  "Edit Transaction",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
