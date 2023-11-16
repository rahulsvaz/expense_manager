import 'dart:developer';

import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DateFilter extends GetxController {
  final Box<Transactions> allTransaction =
      Hive.box<Transactions>('TransactionBox');
  List<Transactions> filter = [];
  List<Transactions> get trans => allTransaction.values.toList();

  getTransactionsInDateRange(DateTime startDate, DateTime endDate) {
    final List<Transactions> allTransactions = trans;

    List<Transactions> filteredTransactions = allTransactions
        .where((transaction) =>
            transaction.dateAndTime
                .isAfter(startDate.subtract(const Duration(days: 1))) &&
            transaction.dateAndTime
                .isBefore(endDate.add(const Duration(days: 1))))
        .toList();

    filteredTransactions.sort((a, b) => a.dateAndTime.compareTo(b.dateAndTime));
    log(startDate.toString());
    filter = filteredTransactions;
  }
}
