


import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnlyExpense extends StatefulWidget {
  const OnlyExpense({super.key});

  @override
  State<OnlyExpense> createState() => _OnlyExpenseState();
}

class _OnlyExpenseState extends State<OnlyExpense> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllers>(
      builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) {
            Transactions transactions =
                controller.expenseTransactionList[index];
            return TransactionCard(
              index: index,
              type: transactions.type,
              dateTime: transactions.dateAndTime,
              imagePath: transactions.imageUrl.toString(),
              color: transactions.type == 'expense'
                  ? Pallete.expenseBackGroundColor
                  : Pallete.incomeBackGroundColor,
              category: transactions.category == 'Amount Added'
                  ? transactions.category
                  : transactions.category.substring(9).toUpperCase(),
              description: transactions.description.toUpperCase(),
              amount: transactions.amount.toString(),
              time: transactions.dateAndTime.toString(),
              iconPath: transactions.type == 'expense'
                  ? 'assets/images/expense.png'
                  : 'assets/images/income.png',
            );
          },
        );
      },
    );
  }
}
