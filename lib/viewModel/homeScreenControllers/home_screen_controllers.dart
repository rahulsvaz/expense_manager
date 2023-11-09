import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenControllers extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');


  List get transactionList => transactionBox.values.toList();
  int get listLength => transactionList.length;

  List get incomeTransactionList {
    return transactionList
        .where((transaction) => transaction.type == 'income')
        .toList();
  }

  List get expenseTransactionList {
    return transactionList
        .where((transaction) => transaction.type == 'expense')
        .toList();
  }

  double getTotalIncome() {
    double income = 0.0;
    for (int i = 0; i < transactionList.length; i++) {
      Transactions addedTransactions = transactionList[i];

      if (addedTransactions.type == 'income') {
        income += addedTransactions.amount;
      }
    }
    return income;
  }

  double getTotalExpense() {
    double expense = 0.0;

    for (int i = 0; i < transactionList.length; i++) {
      Transactions addedTransactions = transactionList[i];

      if (addedTransactions.type == 'expense') {
        expense += addedTransactions.amount;
      }
    }

    return expense;
  }

  double totalBalance() {
    return getTotalIncome() - getTotalExpense();
  }

  deleteTransaction(BuildContext context, int index) {
    transactionBox.deleteAt(index).then((value) => ScaffoldMessenger.of(context)
        .showSnackBar(CustomSnackbar.deleteDoneSnackbar));
    update();
  }
}
