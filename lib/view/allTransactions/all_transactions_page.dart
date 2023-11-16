import 'package:expense_manager/view/allTransactions/Widgets/datePicker/date_picker.dart';
import 'package:expense_manager/viewModel/filterController/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:iconly/iconly.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  final filterController = Get.put(FilterController());
  // // Widget onlyIncomeWidget = const OnlyIncome();
  // // Widget onlyExpenseWidget = const OnlyExpense();
  // Widget dateFilteredWidget = const SortedTransactions();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: width * 0.05,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         height: height * 0.05,
            //         width: width * 0.350,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(height * 0.05),
            //           border: Border.all(color: Pallete.lightGrey),
            //         ),
            //         child: const Center(child: DropDownMonth()),
            //       ),

            //     ],
            //   ),
            // ),

            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: GetBuilder<FilterController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        controller.activeText,
                        style: TextStyle(
                          fontSize: height * 0.026,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        child: controller.filter.value == true
                            ? controller.filterOn
                            : GestureDetector(
                                onTap: () {}, child: controller.noFilter),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
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
                ),

                // Icon Button
                IconButton(
                  onPressed: () {
                    Get.to(const DatePicker());
                  },
                  icon: const Icon(IconlyBold.calendar),
                ),
              ],
            ),

            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: GetBuilder<FilterController>(
                builder: (controller) {
                  return controller.activeScreen;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
