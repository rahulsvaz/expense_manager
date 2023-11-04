import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/screens/NavigationBar/g_nav.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/date_button.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/dropDown/drop_down_button.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/dropDown/drop_down_controller.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/snackbars/snackbar.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/controller/add_transaction_controller.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/controller/date_controller.dart';
import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:expense_manager/screens/home/viewModel/methods/border_decoration_add_field.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/attachment_button.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/howMuch.dart';
import 'package:expense_manager/screens/home/viewModel/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({super.key});

  @override
  State<ExpenseWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  final transactionController = Get.put(AddTransactionController());
  final dateController = Get.put(DateController());
  final categoryController = Get.put(DropDownController());
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
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
              // prefixText: '₹',
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
                  const DropDown(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width * 0.80),
                    child: TextFormField(
                      controller: _descriptionController,
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
                      width: width * 0.05,
                    ),
                    AttachmentButton(
                      width: width * 0.50,
                      height: height,
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
                        ScaffoldMessenger.of(context)
                            .showSnackBar(CustomSnackbar.emptyAmountSnackbar);
                      }
                      final amount =
                          double.parse(_amountController.text.trim());
                      Transactions newTransaction =
                          transactionController.createNewExpense(
                        amount: amount,
                        type: 'expense',
                        dateAndTime: dateController.selectedDate,
                        category: categoryController.selectedCategory.value
                            .toString(),
                        imageUrl: '',
                        description: _descriptionController.text.toString(),
                      );

                      transactionController.addExpense(newTransaction, context);

                      Get.offAll(
                        const GnavNavigation(),
                      );
                    },
                    label: 'Add Expense',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.expenseBackGroundColor,
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
