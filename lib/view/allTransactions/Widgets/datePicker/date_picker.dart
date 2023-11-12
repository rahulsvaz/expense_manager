import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.9,
          child: Column(
            children: [
              SfDateRangePicker(
                toggleDaySelection: true,
                view: DateRangePickerView.month,
                confirmText: 'Done',
                showActionButtons: true,
                onCancel: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
