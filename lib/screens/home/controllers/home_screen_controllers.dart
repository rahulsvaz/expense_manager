import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenControllers extends GetxController {
  Box transactionBox = Hive.box<Transactions>('TransactionBox');

  List get transactionList => transactionBox.values.toList();
  int get listLength => transactionList.length;

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

  deleteTransaction(int index) {
    transactionBox.deleteAt(index);
    update(); 
  }
}
