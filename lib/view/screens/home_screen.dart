import 'package:expense_manager/viewModel/widgets/recent_transaction.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/viewModel/widgets/income_expense_box.dart';
import 'package:expense_manager/viewModel/widgets/see_all_button.dart';
import 'package:expense_manager/viewModel/widgets/size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Container
          Container(
            decoration: homeScreenContainerDecoration(),
            width: Get.size.width,
            height: Get.height * 0.4,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpeg'),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Icon(
                        Icons.notifications_active,
                        size: 37,
                        color: Pallete.purple,
                      )
                    ],
                  ),
                  //Second Row
                  Text(
                    'Account Balance',
                    style: TextStyle(
                      color: Color.fromRGBO(145, 145, 159, 1),
                      fontSize: 16,
                    ),
                  ),
                  Height20(),
                  Text(
                    '₹ 9400',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  Height20(),
                  // Income Expense
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IncomeExpenseBox(
                        logo: 'assets/images/income.png',
                        backGroundColor: Pallete.incomeBackGroundColor,
                        label: 'Income',
                        amount: '9400',
                      ),
                      IncomeExpenseBox(
                          logo: 'assets/images/expense.png',
                          backGroundColor: Pallete.expenseBackGroundColor,
                          label: 'Expense',
                          amount: '3300')
                    ],
                  )
                ],
              ),
            ),
          ),
          const Height30(),
          // // Recent Transaction
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SeeAllButton()
            ],
          ),

          const Height30(),
          // Recent Transaction


          //need to add list view builder here
          const RecentTransaction(
              categoryLogo: 'assets/images/Logo_shopping.png',
              category: 'Shopping',
              description: 'Buy some Groceries',
              amount: '100',
              time: '10:10 AM'),
          const RecentTransaction(
              categoryLogo: 'assets/images/food.png',
              category: 'Food',
              description: 'Launch from Nehdi',
              amount: '180',
              time: '1:10 PM'),
        ],
      ),
      bottomNavigationBar: const AnimatedBottomNavigationBar(
        bottomBar: [
          BottomBarItem(
              icon: Icon(
                Icons.home,
                color: Pallete.purple,
              ),
              iconSelected: Icon(Icons.home)),
          BottomBarItem(
              icon: Icon(
                Icons.history,
                color: Pallete.purple
              ),
              iconSelected: Icon(Icons.history))
        ],
        bottomBarCenterModel: BottomBarCenterModel(
            centerIcon: FloatingCenterButton(
              child: Icon(
                Icons.add,
                color: Pallete.white,
              ),
            ),
            centerIconChild: []),
      ),
    );
  }
}
