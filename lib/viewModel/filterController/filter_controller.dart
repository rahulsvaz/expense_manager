import 'package:expense_manager/view/allTransactions/Widgets/allTransactionWidget/all_transaction_widget.dart';
import 'package:expense_manager/view/allTransactions/Widgets/onlyExpenseWidget/only_expense.dart';
import 'package:expense_manager/view/allTransactions/Widgets/onlyIncomeWidget/only_income.dart';
import 'package:expense_manager/view/allTransactions/Widgets/sortedList/sorted_list.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  RxBool income = false.obs;
  RxBool expense = false.obs;
  RxBool filter = false.obs;

  String activeText = 'All Transaction';

  Widget noFilter = const SizedBox();
  Widget filterOn = const ClearButton();

  Widget activeScreen = const AllTransactionWidget();
  // Widget incomeScreen = const OnlyIncome();
  // Widget expanseScreen = const OnlyExpense();
  Widget filteredScreen = const SortedTransactions();

  clearFilter() {
    expense.value = false;
    income.value = false;
    activeScreen = const AllTransactionWidget();
    activeText = 'All Transaction';
    update();
    filter.value = false;
  }

  enableDisableIncome() {
    income.value = !income.value;

    income.value == true
        ? activeScreen = const OnlyIncome()
        : activeScreen = const AllTransactionWidget();

    income.value == true
        ? activeText = 'All Income'
        : activeText = 'All Transactions';

    if (income.value == true && expense.value == true) {
      activeScreen = const AllTransactionWidget();
      activeText = 'All Transactions';
      income.value = !income.value;
      expense.value = !expense.value;
    }

    update();
  }

  enableDisableExpense() {
    expense.value = !expense.value;

    expense.value == true
        ? activeScreen = const OnlyExpense()
        : activeScreen = const AllTransactionWidget();
    expense.value == true
        ? activeText = 'All Expense'
        : activeText = 'All Transactions';

    if (income.value == true && expense.value == true) {
      activeScreen = const AllTransactionWidget();
      activeText = 'All Transactions';

      income.value = !income.value;
      expense.value = !expense.value;
    }

    update();
  }

  changeToFilteredScreen() {
    filter.value = !filter.value;

    activeScreen = const SortedTransactions();
    activeText = 'Filtered Transactions';

    update();
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (controller) {
      return TextButton(
          onPressed: () {
            controller.clearFilter();
          },
          child: const Text(
            'Clear',
            style: TextStyle(color: Pallete.grey),
          ));
    });
  }
}
