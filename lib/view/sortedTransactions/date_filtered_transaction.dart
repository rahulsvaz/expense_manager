import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateFilteredPage extends StatefulWidget {
  const DateFilteredPage({super.key});

  @override
  State<DateFilteredPage> createState() => _DateFilteredPageState();
}

class _DateFilteredPageState extends State<DateFilteredPage> {
  final filterController = Get.put(DateFilter());
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        Text('Filtered Transaction',
            style: TextStyle(
              fontSize: height * 0.026,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: filterController.income.value,
                    onChanged: (v) {
                    filterController.enableDisableIncome();
                    },
                  ),
                ),
                const Text('Income')
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
                const Text('Expense'),
              ],
            ),
            // TextButton(onPressed: () {


            // }, child: const Text('Clear')),
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Back'),
            )
          ],
        ),
        Expanded(child: GetBuilder<DateFilter>(builder: (controller) {
          return controller.activeScreen;
        },),),
      ],
    ));
  }
}
