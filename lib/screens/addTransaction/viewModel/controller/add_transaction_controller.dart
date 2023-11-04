import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/snackbars/snackbar.dart';
import 'package:expense_manager/screens/addTransaction/viewModel/Widgets/snackbars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';

class AddTransactionController extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');

  addExpense(Transactions newTransaction ,BuildContext context) {
    transactionBox
        .add(newTransaction)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.successSnackBar));
  }

  addIncome(Transactions newTransaction, BuildContext context) {
    transactionBox
        .add(newTransaction)
         .then((value) => ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.successSnackBar));
  }

  Transactions createNewExpense({
    required double amount,
    required String type,
    required DateTime dateAndTime,
    required String category,
    required String imageUrl,
    required String description,
  }) {
    return Transactions(
        amount: amount,
        type: type,
        dateAndTime: dateAndTime,
        category: category,
        description: description,
        imageUrl: imageUrl);
  }

  Transactions createNewIncome({
    required double amount,
    required String type,
    required DateTime dateAndTime,
    required String category,
    required String imageUrl,
    required String description,
  }) {
    return Transactions(
        amount: amount,
        type: type,
        dateAndTime: dateAndTime,
        category: category,
        description: description,
        imageUrl: imageUrl);
  }
}
