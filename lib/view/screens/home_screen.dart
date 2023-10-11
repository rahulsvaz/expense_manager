import 'package:expense_manager/view/screens/add_expence_page.dart';
import 'package:expense_manager/view/screens/add_income_page.dart';
import 'package:expense_manager/viewModel/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/viewModel/widgets/income_expense_box.dart';
import 'package:expense_manager/viewModel/widgets/see_all_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              decoration: homeScreenContainerDecoration(),
              width: Get.size.width,
              height: Get.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
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
                            amount: '3300')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.44,
            child: SizedBox(
              width: width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SeeAllButton()
                ],
              ),
            ),
          ),
          Positioned(
              top: height * 0.92,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: LoginSignUpButton(
                    onPressed: () {
                      Get.dialog(Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: height * 0.2,
                          width: width * 0.8,
                          child: Column(
                            children: [
                              LoginSignUpButton(
                                  onPressed: () {
                                    Get.to(const AddIncomePage());
                                  },
                                  label: 'Add Income',
                                  buttonTextColor: Pallete.white,
                                  backgroundColor:
                                      Pallete.incomeBackGroundColor),
                              const SizedBox(
                                height: 10,
                              ),
                              LoginSignUpButton(
                                  onPressed: () {
                                    Get.to(const AddExpensePage());
                                  },
                                  label: 'Add Expense',
                                  buttonTextColor: Pallete.white,
                                  backgroundColor:
                                      Pallete.expenseBackGroundColor)
                            ],
                          ),
                        ),
                      ));
                    },
                    label: 'Add',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.purple),
              ))
        ],
      ),
    );
  }
}
