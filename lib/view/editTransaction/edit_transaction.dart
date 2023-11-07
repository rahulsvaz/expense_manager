import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/viewModel/addTransaction/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';

class EditTransactionPage extends StatefulWidget {
  final String amount;

  const EditTransactionPage({required this.amount, super.key});

  @override
  State<EditTransactionPage> createState() => _EditTransactionPageState();
}

class _EditTransactionPageState extends State<EditTransactionPage> {
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final tController = Get.put(TransactionControllers());
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
                  color: Pallete.expenseDetails,
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
                      ),
                    ),
                    Text(
                      'Edit Transaction',
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/images/trash.png'),
                  ],
                ),
              ),
            ),
            Positioned(
                top: height * 0.10,
                left:width*0.3,
                right: 0,
                child: Center(
                  child: SizedBox(
                 
                    child: TextFormField(
                      controller: _amountController..text = widget.amount,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Pallete.white, fontSize: 80),
                      showCursor: true,
                      cursorHeight: height * 0.1,
                      cursorColor: Pallete.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // prefixText: '₹',
                        hintText: '₹0',
                        hintStyle: TextStyle(
                            fontSize: height * 0.11, color: Pallete.white),
                      ),
                    ),
                  ),
                )),
            
            Positioned(
              top: height * .27,
              child: Text(
                'Saturday 4 June 2021 10:10 am',
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
                'Description',
                style: TextStyle(fontSize: height * 0.023, color: Pallete.grey),
              ),
            ),
            Positioned(
              top: height * .55,
              left: width * 0.09,
              child: Text(
                'Paid Cash',
                style: TextStyle(
                  fontSize: height * 0.025,
                ),
              ),
            ),
            Positioned(
              top: height * .65,
              left: width * 0.09,
              child: Text(
                'Attachment',
                style: TextStyle(fontSize: height * 0.023, color: Pallete.grey),
              ),
            ),
            Positioned(
              top: height * .75,
              child: Image.asset('assets/images/Rectangle 207.png',
                  height: height * 0.12),
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
                  tController.edit.value = !tController.edit.value;
                },
                child: const Text(
                  "Save Changes",
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
