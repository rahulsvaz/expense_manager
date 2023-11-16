import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  final format = DateFormat.Hms();
  final formatter = DateFormat.yMd();
  DateTime selectedDate = DateTime.now();



// D A T E   P I C K E R
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


// D A T E      F O R M A T T E R 
  String formatDate(DateTime date) {
    return format.format(date);
  }

  String get formattedDate {
    return formatter.format(selectedDate);
  }
}
