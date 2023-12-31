import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenControllers extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');

  final userBox = Hive.box<User>('UserBox');

// TO GET ALL TRANSACTION TO A LIST
  List get transactionList => transactionBox.values.toList();
  int get listLength => transactionList.length;

  // FOR ONLY INCOME TRANSACTION  LIST

  List get incomeTransactionList {
    return transactionList
        .where((transaction) => transaction.type == 'income')
        .toList();
  }

  // FOR ONLY EXPENSE TRANSACTION  LIST
  List get expenseTransactionList {
    return transactionList
        .where((transaction) => transaction.type == 'expense')
        .toList();
  }

// GET TOTAL INCOME AMOUNT
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

// GET TOTAL EXPENSE LIST AMOUNT
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

// FOR DELETING TRANSACTION LIST

  deleteTransaction(BuildContext context, int index) {
    transactionBox.deleteAt(index).then((value) => ScaffoldMessenger.of(context)
        .showSnackBar(CustomSnackbar.deleteDoneSnackbar));
    update();
  }
}
