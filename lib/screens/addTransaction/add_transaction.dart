import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/controller/transaction_screen_controller.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/expense_widget.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/income_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  Widget expenseScreen = const ExpenseWidget();
  Widget incomeScreen = const IncomeWidget();

  @override
  Widget build(BuildContext context) {
    final widgetController = Get.put(TransactionScreenController());
    final height = MediaQuery.sizeOf(context).height;
final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Obx(() => AnimatedContainer(
            height: Get.height,
            duration: const Duration(
                milliseconds: 1000), // Adjust the duration as needed
            decoration: BoxDecoration(
              color: widgetController.activeWidget.value == 'expense-widget'
                  ? Pallete.incomeBackGroundColor
                  : Pallete.expenseBackGroundColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() =>
                      widgetController.activeWidget.value == 'expense-widget'
                          ? incomeScreen
                          : expenseScreen),
                   SizedBox(
                    height: height*0.03,
                  ),
                  Obx(() => OutlinedButton(
                        onPressed: () {
                          if (widgetController.activeWidget.value ==
                              'expense-widget') {
                            widgetController.changeActiveWidget();
                          } else {
                            widgetController.changeToExpense();
                          }
                        },
                        child: Text(
                          widgetController.activeWidget.value ==
                                  'expense-widget'
                              ? 'Add Expense Details??'
                              : 'Add Income Details??',
                          style:  TextStyle(
                              color: Pallete.white, fontSize: width*0.04),
                        ),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
