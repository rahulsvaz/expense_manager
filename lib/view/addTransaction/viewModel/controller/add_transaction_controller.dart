import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTransactionController extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');


  addExpense(Transactions newTransaction) {
    transactionBox.add(newTransaction);
  }

  addIncome(Transactions newTransaction) {
    transactionBox.add(newTransaction);
  }

  Transactions createNewExpense(
      {required double amount,
      required String type,
      required DateTime dateAndTime,
      required String category,
      required String imageUrl,
      required String description,
      required String transactionType}) {
    return Transactions(
        amount: amount,
        type: type,
        dateAndTime: dateAndTime,
        category: category,
        description: description,
        imageUrl: imageUrl);
  }


 
}
