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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Box userBox = Hive.box<User>('UserBox');
    Box transactionBox = Hive.box<Transactions>('TransactionBox');
    final homeScreenController = Get.put(HomeScreenControllers());
    User currentUser = userBox.getAt(0);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    double income = homeScreenController.getTotalIncome();
    double expense = homeScreenController.getTotalExpense();

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
                        File(currentUser.imageUrl),
                      ),
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
                    )
                    //
                    //
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

                Text(
                income.toString(),
                  style: TextStyle(
                      fontSize: height * 0.05, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * .04,
                ),
                // Income Expense
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IncomeExpenseBox(
                      logo: 'assets/images/income.png',
                      backGroundColor: Pallete.incomeBackGroundColor,
                      label: 'Income',
                      amount: income.toString(),
                    ),
                     IncomeExpenseBox(
                        logo: 'assets/images/expense.png',
                        backGroundColor: Pallete.expenseBackGroundColor,
                        label: 'Expense',
                        amount: expense.toString()),
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
                    fontSize: height * 0.02, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Pallete.purple, fontSize: height * 0.02),
                  ))
            ],
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: transactionBox.listenable(),
              builder: (context, transactionBox, child) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                  ),
                  itemCount:
                      transactionBox.length < 4 ? transactionBox.length : 4,

                      
                  itemBuilder: (context, index) {
                     int reversedIndex = transactionBox.length - 1 - index;
                    Transactions transaction = transactionBox.getAt(reversedIndex);

                    if (transactionBox.isEmpty) {
                      return const Center(
                        child: Text('No Transaction Found'),
                      );
                    } else {
                      return GestureDetector(
                        onLongPress: () {
                          transactionBox.deleteAt(reversedIndex);
                        },
                        child: TransactionCard(
                          icon: Icon(categoryICons[transaction.category]),
                          color: transaction.type == 'expense'
                              ? Pallete.expenseBackGroundColor
                              : Pallete.incomeBackGroundColor,
                          logo: 'assets/images/food.png',
                          category: transaction.category,
                          description: transaction.description,
                          amount: transaction.amount.toString(),
                          time: transaction.dateAndTime.toString(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
