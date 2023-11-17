import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTransactionController extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');

  // N O T I F I C A T I O N   F O R    A D D I N G  N E W   T R A N S A C T I O N

  addExpense(Transactions newTransaction, BuildContext context) {
    transactionBox.add(newTransaction).then((value) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackbar.successSnackBar));
  }

  addIncome(Transactions newTransaction, BuildContext context) {
    transactionBox.add(newTransaction).then(
          (value) => ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnackbar.successSnackBar),
        );
  }

  updateTransaction(
      Transactions updated, BuildContext context, int index) async {
    await transactionBox.putAt(index, updated).then(
          (value) => ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnackbar.successSnackBar),
        );
  }

  /// delete all transaction
  deleteAllTransaction() async {
    transactionBox.deleteAll(transactionBox.keys);

    // for (int i = 0; i <= transactionBox.length; i++) {
    //   await transactionBox.deleteAt(i);
    // }
  }

//  F O R   A D D I N G   N E W     T R A N S A C T I O N
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
