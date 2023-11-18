import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/allTransactions/Widgets/sortedList/sorted_list.dart';
import 'package:expense_manager/view/sortedTransactions/date_sorted_expense_transaction.dart';
import 'package:expense_manager/view/sortedTransactions/date_sorted_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DateFilter extends GetxController {
  RxBool income = false.obs;
  RxBool expense = false.obs;

  Widget activeScreen = const SortedTransactions();

  // F I L T E R     W I T H      D A T E

  final Box<Transactions> allTransaction =
      Hive.box<Transactions>('TransactionBox');
  List<Transactions> filter = [];
  List<Transactions> get transaction => allTransaction.values.toList();

  getTransactionsInDateRange(DateTime startDate, DateTime endDate) {
    final List<Transactions> allTransactions = transaction;

    List<Transactions> filteredTransactions = allTransactions
        .where(
          (transaction) =>
              transaction.dateAndTime.isAfter(
                startDate.subtract(
                  const Duration(days: 1),
                ),
              ) &&
              transaction.dateAndTime.isBefore(
                endDate.add(
                  const Duration(days: 1),
                ),
              ),
        )
        .toList();
    filteredTransactions.sort((a, b) => a.dateAndTime.compareTo(b.dateAndTime));
    filter = filteredTransactions;
  }

// date filtered expense

  List get dateFilterdExpenseTransactionList {
    return filter
        .where((transaction) => transaction.type == 'expense')
        .toList();
  }

  List get dateFilterdIncomeTransactionList {
    return filter.where((transaction) => transaction.type == 'income').toList();
  }

  clearFilter() {
    expense.value = false;
    income.value = false;
    activeScreen = const SortedTransactions();
    update();
  }

  enableDisableIncome() {
    income.value = !income.value;

    activeScreen = const DateFilteredOnlyIncome();

    income.value == true
        ? activeScreen = const DateFilteredOnlyIncome()
        : const SortedTransactions();

    if (income.value == true && expense.value == true ||
        income.value == false && expense.value == false) {
      activeScreen = const SortedTransactions();
      income.value = !income.value;
      expense.value = !expense.value;

    }
    if(expense.value ==false && income.value ==false){
      activeScreen = const SortedTransactions();
    }
    if(expense.value ==true && income.value ==false){
      activeScreen = const DateFilteredOnlyExpense();
    }
if(expense.value ==false && income.value ==true){
      activeScreen = const DateFilteredOnlyIncome();
    }
    update();
  }

  enableDisableExpense() {
    expense.value = !expense.value;

    expense.value == true
        ? activeScreen = const DateFilteredOnlyExpense()
        : const SortedTransactions();
 if(expense.value ==false && income.value ==false){
      activeScreen = const SortedTransactions();
    }
    if (income.value == true && expense.value == true ) {
      activeScreen = const SortedTransactions();

      income.value = !income.value;
      expense.value = !expense.value;
    }

    if(expense.value ==true && income.value ==false){
      activeScreen = const DateFilteredOnlyExpense();
    }
if(expense.value ==false && income.value ==true){
      activeScreen = const DateFilteredOnlyIncome();
    }

    update();
  }

  changeToFilteredScreen() {
    activeScreen = const SortedTransactions();

    update();
  }
}
