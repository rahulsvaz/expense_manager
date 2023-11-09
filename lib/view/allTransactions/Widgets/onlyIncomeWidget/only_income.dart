import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlyIncome extends StatefulWidget {
  const OnlyIncome({super.key});

  @override
  State<OnlyIncome> createState() => _OnlyIncomeState();
}

class _OnlyIncomeState extends State<OnlyIncome> {
  final controller = Get.put(HomeScreenControllers());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllers>(
      builder: (controller) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: controller.incomeTransactionList.length,
          itemBuilder: (context, index) {
            Transactions transactions = controller.incomeTransactionList[index];
            return TransactionCard(
                type: transactions.type,
                index: index,
                dateTime: transactions.dateAndTime,
                iconPath: 'assets/images/income.png',
                color: Pallete.incomeBackGroundColor,
                category: transactions.category,
                description: transactions.description,
                amount: transactions.amount.toString(),
                time: transactions.dateAndTime.toString(),
                imagePath: '');
          },
        );
      },
    );
  }
}
