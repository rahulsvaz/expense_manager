import 'package:expense_manager/view/screens/all_transactionas_page.dart';
import 'package:expense_manager/viewModel/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
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
                    CircleAvatar(
                      radius: height * 0.02,
                      backgroundImage: const AssetImage(
                        'assets/images/user.jpeg',
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

          SizedBox(
            height: height * 0.42,
            child: ListView.builder(
                itemCount: 3,
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

          SwipeButton.expand(
            width: width * 0.7,
            height: height * 0.07,
            borderRadius: BorderRadius.circular(20),
            thumb: const Icon(
              Icons.double_arrow_rounded,
              color: Colors.white,
            ),
            activeThumbColor: Pallete.purple,
            activeTrackColor: Colors.grey.shade300,
            onSwipe: () {

            },
            child: const Text(
              "Add Transaction",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          //   child: LoginSignUpButton(
          //       onPressed: () {
          //         Get.dialog(
          //           Center(
          //             child: Container(
          //               decoration: const BoxDecoration(
          //                 borderRadius: BorderRadius.all(Radius.circular(20)),
          //               ),
          //               height: height * 0.2,
          //               width: width * 0.8,
          //               child: Column(
          //                 children: [
          //                   LoginSignUpButton(
          //                       onPressed: () {
          //                         Get.back();
          //                         Get.to(const AddIncomePage());
          //                       },
          //                       label: 'Add Income',
          //                       buttonTextColor: Pallete.white,
          //                       backgroundColor: Pallete.incomeBackGroundColor),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   LoginSignUpButton(
          //                       onPressed: () {
          //                         Get.back();
          //                         Get.to(const AddExpensePage());
          //                       },
          //                       label: 'Add Expense',
          //                       buttonTextColor: Pallete.white,
          //                       backgroundColor: Pallete.expenseBackGroundColor)
          //                 ],
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //       label: 'Add',
          //       buttonTextColor: Pallete.white,
          //       backgroundColor: Pallete.purple),
          // ),
        ],
      ),
    );
  }
}
