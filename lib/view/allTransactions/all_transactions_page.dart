import 'package:expense_manager/view/allTransactions/Widgets/dropDown/onlyIncomeWidget/only_income.dart';
import 'package:expense_manager/viewModel/filterController/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/view/allTransactions/Widgets/dropDown/drop_down_month.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:iconly/iconly.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  final filterController = Get.put(FilterController());
  Widget onlyIncomeWidget = const OnlyIncome();
  Widget onlyExpenseWidget = const OnlyExpense();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.05),
                    border: Border.all(color: Pallete.lightGrey),
                  ),
                  child: const Center(child: DropDownMonth()),
                ),
                IconButton(
                  onPressed: () {
                    // bottom sheet
                    // Get.bottomSheet(
                    //     SizedBox(
                    //       height: height * .40,
                    //       child: Column(children: [
                    //         SizedBox(
                    //           height: height * .10,
                    //         ),
                    //       ]),
                    //     ),
                    //     backgroundColor: Pallete.scaffoldBgColor,
                    //     elevation: 10,
                    //     enterBottomSheetDuration:
                    //         const Duration(milliseconds: 300),
                    //     exitBottomSheetDuration:
                    //         const Duration(milliseconds: 200));
                  },
                  icon: const Icon(IconlyBold.filter_2),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: filterController.income.value,
                        onChanged: (value) {
                          filterController.enableDisableIncome();
                        }),
                  ),
                  Obx(
                    () => Text(
                      'Income',
                      style: TextStyle(
                          color: filterController.income.value
                              ? Pallete.incomeBackGroundColor
                              : Pallete.grey),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                        value: filterController.expense.value,
                        onChanged: (value) {
                          filterController.enableDisableExpense();
                        }),
                  ),
                  Obx(
                    () => Text(
                      'Expense',
                      style: TextStyle(
                          color: filterController.expense.value
                              ? Pallete.expenseBackGroundColor
                              : Pallete.grey),
                    ),
                  ),
                ],
              ),
              Obx(
                () => AnimatedContainer(
                    curve: Curves.linear,
                    duration: const Duration(microseconds: 1000),
                    child: filterController.expense.value ||
                            filterController.income.value
                        ? TextButton(
                            onPressed: () {
                              filterController.clearFilter();
                            },
                            child: const Text(
                              'Clear',
                              style: TextStyle(color: Pallete.grey),
                            ),
                          )
                        : null),
              )
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Text(
              'All Transactions',
              style: TextStyle(
                fontSize: height * 0.026,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          
            Expanded(
              child:onlyIncomeWidget,
            )
        ],
      ),
    );
  }
}






/* ValueListenableBuilder(
                  valueListenable: transactionBox.listenable(),
                  builder: (context, Box<Transactions> transactionBox, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Added this line
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                      ),
                      itemCount: transactionBox.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = transactionBox.length - 1 - index;

                        Transactions transaction =
                            transactionBox.getAt(reversedIndex)!;

                        if (transactionBox.isEmpty) {
                          return const Center(
                            child: Text('No Transaction Found'),
                          );
                        }
                        if (filterController.income.isTrue) {
                          return Text('Income Filter');
                        } else {
                          return TransactionCard(
                            index: index,
                            type: transaction.type,
                            dateTime: transaction.dateAndTime,
                            imagePath: transaction.imageUrl,
                            iconPath: transaction.type == 'expense'
                                ? 'assets/images/expense.png'
                                : 'assets/images/income.png',
                            color: transaction.type == 'expense'
                                ? Pallete.expenseBackGroundColor
                                : Pallete.incomeBackGroundColor,
                            logo: 'assets/images/food.png',
                            category: transaction.category,
                            description: transaction.description,
                            amount: transaction.amount.toString(),
                            time: transaction.dateAndTime.toString(),
                          );
                        }
                      },
                    );
                  },
                ),*/

                