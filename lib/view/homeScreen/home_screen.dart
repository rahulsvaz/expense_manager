import 'dart:io';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/graphScreen/graph_screen.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:expense_manager/view/homeScreen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/view/homeScreen/widgets/income_expense_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeScreenControllers());

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final userBox = Hive.box<User>('UserBox');
    final user = userBox.getAt(0);

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
                      backgroundImage: FileImage(
                        File(
                          user!.imageUrl.toString(),
                        ),
                      ),
                    ),
                    Text(
                      'Hello ${user.name}',
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Pallete.grey),
                    ),
                    // SizedBox(
                    //   width: width * 0.4,
                    // ),
                    IconButton(
                      onPressed: () {
                        Get.to(const GraphScreen());
                      },
                      icon: Icon(
                        Icons.graphic_eq,
                        size: height * 0.04,
                        color: Pallete.grey,
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
                    '₹ ${controller.totalBalance().toString()}',
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
                    GetBuilder<HomeScreenControllers>(
                      builder: (controller) {
                        return IncomeExpenseBox(
                          logo: 'assets/images/expense.png',
                          backGroundColor: Pallete.expenseBackGroundColor,
                          label: 'Expense',
                          amount: homeController.getTotalExpense().toString(),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
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
          SizedBox(
              height: height * 0.26,
              child: GetBuilder<HomeScreenControllers>(
                builder: (controller) {
                  double income = controller.getTotalIncome();
                  double expense = controller.getTotalExpense();
                  Map<String, double> dataMap = {
                    "Income": income,
                    "Expense": expense
                  };

                  return PieChart(
                    dataMap: dataMap,
                    colorList: const [
                      Pallete.incomeBackGroundColor,
                      Pallete.expenseBackGroundColor
                    ],
                  );
                },
              )),
          Expanded(
            child: GetBuilder<HomeScreenControllers>(
              builder: (controller) {
                return ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    int reversedIndex =
                        controller.transactionList.length - 1 - index;
                    Transactions transaction =
                        controller.transactionList[reversedIndex];
                    return Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04,
                          right: width * 0.04,
                          bottom: height * 0.0),
                      child: Dismissible(
                        key:
                            ValueKey(controller.transactionList[reversedIndex]),
                        onDismissed: (direction) async {
                          controller.deleteTransaction(context, reversedIndex);
                        },
                        child: TransactionCard(
                          dateTime: transaction.dateAndTime,
                          imagePath: transaction.imageUrl,
                          color: transaction.type == 'expense'
                              ? Pallete.expenseBackGroundColor
                              : Pallete.incomeBackGroundColor,
                          logo: 'assets/images/food.png',
                          category: transaction.category,
                          description: transaction.description,
                          amount: transaction.amount.toString(),
                          time: transaction.dateAndTime.toString(),
                          iconPath: transaction.type == 'expense'
                              ? 'assets/images/expense.png'
                              : 'assets/images/income.png',
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
