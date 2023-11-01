import 'dart:io';
import 'package:expense_manager/model/enum.dart';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/home/controllers/home_screen_controllers.dart';
import 'package:expense_manager/view/home/viewModel/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/home/viewModel/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/view/home/viewModel/widgets/income_expense_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<User>('UserBox');
    final homeController = Get.put(HomeScreenControllers());

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: homeScreenContainerDecoration(),
            width: Get.width,
            height: Get.height * 0.4,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                //Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: height * 0.02,
                      // backgroundImage: FileImage(
                      //   File(userBox.getAt(0)?imageUrl),
                      // ),
                    ),
                    SizedBox(
                      width: width * 0.4,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.note_add_rounded,
                        size: height * 0.04,
                        color: Pallete.purple,
                      ),
                    ),
                  ],
                ),
                //Second Row
                Text(
                  'Account Balance',
                  style: TextStyle(
                    color: Pallete.grey,
                    fontSize: height * 0.02,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GetBuilder<HomeScreenControllers>(builder: (controller) {
                  return Text(
                    controller.totalBalance().toString(),
                    style: TextStyle(
                        fontSize: height * 0.05, fontWeight: FontWeight.w700),
                  );
                }),
                SizedBox(
                  height: height * 0.04,
                ),
                // Income Expense
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GetBuilder<HomeScreenControllers>(builder: (controller) {
                      return IncomeExpenseBox(
                        logo: 'assets/images/income.png',
                        backGroundColor: Pallete.incomeBackGroundColor,
                        label: 'Income',
                        amount: homeController.getTotalIncome().toString(),
                      );
                    }),
                    GetBuilder<HomeScreenControllers>(builder: (controller) {
                      return IncomeExpenseBox(
                        logo: 'assets/images/expense.png',
                        backGroundColor: Pallete.expenseBackGroundColor,
                        label: 'Expense',
                        amount: homeController.getTotalExpense().toString(),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Pallete.purple,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<HomeScreenControllers>(
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    int reversedIndex =
                        controller.transactionList.length - 1 - index;
                    Transactions transaction =
                        controller.transactionList[reversedIndex];
                    return GestureDetector(
                      onLongPress: () {
                        controller.deleteTransaction(index);
                        controller.totalBalance();
                        controller.getTotalIncome();
                        controller.getTotalExpense();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TransactionCard(
                          color: transaction.type == 'expense'
                              ? Pallete.expenseBackGroundColor
                              : Pallete.incomeBackGroundColor,
                          logo: 'assets/images/food.png',
                          category: transaction.category,
                          description: transaction.description,
                          amount: transaction.amount.toString(),
                          time: transaction.dateAndTime.toString(),
                          icon: transaction.type == 'expense'
                              ? const Icon(
                                  Icons.arrow_circle_up,
                                  color: Pallete.expenseBackGroundColor,
                                )
                              : const Icon(
                                  Icons.arrow_circle_down,
                                  color: Pallete.incomeBackGroundColor,
                                ),
                        ),
                      ),
                    );
                  },
                  itemCount:
                      controller.listLength > 4 ? 4 : controller.listLength,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
