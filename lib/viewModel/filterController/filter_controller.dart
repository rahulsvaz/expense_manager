import 'package:expense_manager/view/allTransactions/Widgets/allTransactionWidget/all_transaction_widget.dart';
import 'package:expense_manager/view/allTransactions/Widgets/onlyExpenseWidget/only_expense.dart';
import 'package:expense_manager/view/allTransactions/Widgets/onlyIncomeWidget/only_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  RxBool income = false.obs;
  RxBool expense = false.obs;

  String activeText = 'All Transaction';

  Widget activeScreen = const AllTransactionWidget();
  Widget incomeScreen = const OnlyIncome();
  Widget expanseScreen = const OnlyExpense();

  clearFilter() {
    expense.value = false;
    income.value = false;
    activeScreen = const AllTransactionWidget();
    activeText = 'All Transaction';
    update();
  }

  enableDisableIncome() {
    income.value = !income.value;

    income.value == true
        ? activeScreen = const OnlyIncome()
        : activeScreen = const AllTransactionWidget();

    update();
  }

  enableDisableExpense() {
    expense.value = !expense.value;

    expense.value == true
        ? activeScreen = const OnlyExpense()
        : activeScreen = const AllTransactionWidget();
    update();
  }
}
