import 'package:expense_manager/view/sortedTransactions/date_filttered_transaction.dart';
import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final controller = Get.put(DateFilter());
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.9,
          child: Column(
            children: [
              SfDateRangePicker(
                maxDate: DateTime.now(),
                key: key,
                selectionMode: DateRangePickerSelectionMode.extendableRange,
                view: DateRangePickerView.month,
                confirmText: 'Filter',
                showActionButtons: true,
                onCancel: () {
                  Get.back();
                },
                onSubmit: (value) {     
                  if (value is PickerDateRange) {
                    controller.getTransactionsInDateRange(
                        value.startDate!, value.endDate!);
                    // filterController.changeToFilteredScreen();
                    Get.to(()=> const DateFilteredPage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

