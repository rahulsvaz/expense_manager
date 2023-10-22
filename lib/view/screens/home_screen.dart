import 'package:expense_manager/view/screens/add_transaction.dart';
import 'package:expense_manager/view/screens/all_transactions_page.dart';
import 'package:expense_manager/viewModel/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/viewModel/widgets/income_expense_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

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
                    GestureDetector(
                      onTap: () {
                        Get.to(AddTransaction());
                      },
                      child: CircleAvatar(
                        radius: height * 0.02,
                        backgroundImage: const AssetImage(
                          'assets/images/user.jpeg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.4,
                    ),
                    Icon(
                      Icons.notifications_active,
                      size: height * 0.04,
                      color: Pallete.purple,
                    )
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
                  '₹ 9400',
                  style: TextStyle(
                      fontSize: height * 0.05, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * .04,
                ),
                // Income Expense
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IncomeExpenseBox(
                      logo: 'assets/images/income.png',
                      backGroundColor: Pallete.incomeBackGroundColor,
                      label: 'Income',
                      amount: '94079',
                    ),
                    IncomeExpenseBox(
                        logo: 'assets/images/expense.png',
                        backGroundColor: Pallete.expenseBackGroundColor,
                        label: 'Expense',
                        amount: '3300'),
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
              GestureDetector(
                  onTap: () {
                    Get.to(const AllTransactions());
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                        color: Pallete.purple, fontSize: height * 0.02),
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(
                    top: height * 0.03,
                    left: width * 0.03,
                    right: width * 0.03),
                itemCount: 3,
                addRepaintBoundaries: false,
                itemBuilder: (context, index) {
                  return const TransactionCard(
                    logo: 'assets/images/food.png',
                    category: 'Food',
                    description: 'Dinner with family',
                    amount: '500',
                    time: '10:10 AM',
                  );
                }),
          ),
        ],
      ),
    );
  }
}
