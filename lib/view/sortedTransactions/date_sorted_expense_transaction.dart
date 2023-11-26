import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DateFilteredOnlyExpense extends StatefulWidget {
  const DateFilteredOnlyExpense({super.key});

  @override
  State<DateFilteredOnlyExpense> createState() =>
      _DateFilteredOnlyIncomeState();
}

class _DateFilteredOnlyIncomeState extends State<DateFilteredOnlyExpense> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return GetBuilder<DateFilter>(
      builder: (controller) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: controller.dateFilterdExpenseTransactionList.length,
          itemBuilder: (context, index) {
            int reversedIndex =
                controller.dateFilterdExpenseTransactionList.length - 1 - index;

            Transactions transactions =
                controller.dateFilterdExpenseTransactionList[reversedIndex];
            return Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.01),
              child: TransactionCard(
                  type: transactions.type,
                  index: index,
                  dateTime: transactions.dateAndTime,
                  iconPath: 'assets/images/expense.png',
                  color: Pallete.expenseBackGroundColor,
                  category: transactions.category.substring(9),
                  description: transactions.description,
                  amount: transactions.amount.toString(),
                  time: transactions.dateAndTime.toString(),
                  imagePath: ''),
            );
          },
        );
      },
    );
  }
}
