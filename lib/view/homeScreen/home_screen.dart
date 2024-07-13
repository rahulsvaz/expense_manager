import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/allTransactions/Widgets/allTransactionWidget/all_transaction_widget.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/methods/home_screen_container_decoration.dart';
import 'package:expense_manager/view/homeScreen/widgets/income_expense_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeScreenControllers());
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Hive.box<User>('UserBox');


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

                //Second Row
                Text(
                  'Account Balance',
                  style: TextStyle(
                    color: ColorsClass.grey,
                    fontSize: height * 0.02,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GetBuilder<HomeScreenControllers>(builder: (controller) {
                  MoneyFormatter fmf =
                      MoneyFormatter(amount: controller.totalBalance());

                  return TweenAnimationBuilder(
                      duration: const Duration(seconds: 1),
                      tween: Tween(begin: 0, end: height * 0.05),
                      builder: (context, object, widget) {
                        return Text(
                          '₹ ${fmf.output.compactNonSymbol}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: double.parse(object.toString()),
                              fontWeight: FontWeight.w700,
                            ),
                        );
                      },);
                },),
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
                        backGroundColor: ColorsClass.incomeBackGroundColor,
                        label: 'Income',
                        amount: homeController.getTotalIncome().toString(),
                      );
                    },),
                    GetBuilder<HomeScreenControllers>(
                      builder: (controller) {
                        return IncomeExpenseBox(
                          logo: 'assets/images/expense.png',
                          backGroundColor: ColorsClass.expenseBackGroundColor,
                          label: 'Expense',
                          amount: homeController.getTotalExpense().toString(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: height * 0.23,
            child: GetBuilder<HomeScreenControllers>(
              builder: (controller) {
                double income = controller.getTotalIncome();
                double expense = controller.getTotalExpense();
                Map<String, double> dataMap = {
                  "Income": income,
                  "Expense": expense,
                };

                return PieChart(
                  chartType: ChartType.disc,
                  dataMap: dataMap,
                  colorList: const [
                    ColorsClass.incomeBackGroundColor,
                    ColorsClass.expenseBackGroundColor,
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              SizedBox(
                width: width * 0.09,
              ),
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Expanded(child: AllTransactionWidget()),
        ],
      ),
    );
  }
}
