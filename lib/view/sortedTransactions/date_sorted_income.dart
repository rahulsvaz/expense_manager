import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DateFilteredOnlyIncome extends StatefulWidget {
  const DateFilteredOnlyIncome({super.key});

  @override
  State<DateFilteredOnlyIncome> createState() => _DateFilteredOnlyIncomeState();
}

class _DateFilteredOnlyIncomeState extends State<DateFilteredOnlyIncome> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return GetBuilder<DateFilter>(builder: (controller) {
      return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: controller.dateFilterdIncomeTransactionList.length,
        itemBuilder: (context, index) {
          int reversedIndex =
              controller.dateFilterdIncomeTransactionList.length - 1 - index;

          Transactions transactions =
              controller.dateFilterdIncomeTransactionList[reversedIndex];
          return Padding(
            padding: EdgeInsets.only(
                left: width * 0.04, right: width * 0.04, bottom: height * 0.01),
            child: TransactionCard(
                type: transactions.type,
                index: index,
                dateTime: transactions.dateAndTime,
                iconPath: 'assets/images/income.png',
                color: Pallete.incomeBackGroundColor,
                category: transactions.category,
                description: transactions.description,
                amount: transactions.amount.toString(),
                time: transactions.dateAndTime.toString(),
                imagePath: ''),
          );
        },
      );
    });
  }
}
