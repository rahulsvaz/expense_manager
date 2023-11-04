import 'package:expense_manager/model/category.dart';
import 'package:expense_manager/viewModel/mothController/month_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownMonth extends StatefulWidget {
  const DropDownMonth({super.key});

  @override
  State<DropDownMonth> createState() => _DropDownMonthState();
}

class _DropDownMonthState extends State<DropDownMonth> {
  final month = Get.put(MonthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<Month>(
        value: month.selectedMonth.value,
        underline: const Text(''),
        onChanged: (Month? value) {
          month.selectedMonth.value = value!;
        },
        items: Month.values
            .map((month) => DropdownMenuItem<Month>(
                  onTap: () {},
                  value: month,
                  child: Text(month.name.toString().toUpperCase(),
                      style: const TextStyle(fontSize: 14)),
                ))
            .toList(),
      ),
    );
  }
}
