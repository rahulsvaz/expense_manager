
import 'package:expense_manager/view/allTransactions/Widgets/sortedList/sorted_list.dart';
import 'package:expense_manager/viewModel/dateFilterController/date_filter_controller.dart';
import 'package:expense_manager/viewModel/filterController/filter_controller.dart';
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
    final filterController = Get.put(FilterController());
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

                 

                  if (value is PickerDateRange){
                    controller.getTransactionsInDateRange(value.startDate!, value.endDate!);
                    filterController.changeToFilteredScreen();
                    Get.back();
                  
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



// void dateRangePicker(context)async{

// final DateRangePicker? picked = await showDateRangePicker(
//   context: context,
// initialDateRange: DateTimeRange(
// start: DateTime.now(), 
// end: 
// DateTime.now()), 
// firstDate: DateTime(2023), 
// lastDate: DateTime.now());

// }