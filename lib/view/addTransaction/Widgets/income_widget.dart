import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/addTransaction/Widgets/date_button.dart';
import 'package:expense_manager/viewModel/dopDownController/drop_down_controller.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:expense_manager/viewModel/addTransaction/add_transaction_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/date_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/image_controller.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/home/viewModel/methods/border_decoration_add_field.dart';
import 'package:expense_manager/view/addTransaction/Widgets/attachment_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/howMuch.dart';
import 'package:expense_manager/view/home/viewModel/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeWidget extends StatefulWidget {
  const IncomeWidget({super.key});

  @override
  State<IncomeWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final transactionController = Get.put(AddTransactionController());
  final dateController = Get.put(DateController());
  final categoryController = Get.put(DropDownController());
  final attachment = Get.put(PickImageController());
  String? pickedAttachment;
  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
            controller: _amountController,
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
                    height: height * 0.03,
                  ),
                  // const DropDown(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width * 0.80),
                    child: TextFormField(
                      controller: _descriptionController,
                      maxLength: 20,
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
                      width: width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        attachment.pickAttachment();
                      },
                      child: AttachmentButton(
                        width: width * 0.50,
                        height: height,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    const DateButton()
                  ]),
                  SizedBox(height: height * 0.04),
                  LoginSignUpButton(
                    onPressed: () {
                      if (_amountController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.emptyAmountSnackbar);
                      }

                      final amount =
                          double.parse(_amountController.text.toString());
                      Transactions newIncome =
                          transactionController.createNewIncome(
                        amount: amount,
                        type: 'income',
                        dateAndTime: dateController.selectedDate,
                        category: 'Amount Added',
                        imageUrl: attachment.imagePath.value,
                        description: _descriptionController.text.toString(),
                      );
                      transactionController.addIncome(newIncome,context);

                      Get.offAll(const GnavNavigation());
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
