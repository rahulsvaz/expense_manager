import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  final formatter = DateFormat.yMd();
  DateTime selectedDate = DateTime.now();

  showPresentDatePicker(BuildContext context) async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      selectedDate = pickedDate;
    }
  }




  String get formattedDate {    
    return formatter.format(selectedDate);
  }
}
