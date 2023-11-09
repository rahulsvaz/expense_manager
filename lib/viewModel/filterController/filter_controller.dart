import 'package:get/get.dart';

class FilterController extends GetxController {
  RxBool income = false.obs;
  RxBool expense = false.obs;

  clearFilter() {
    expense.value = false;
    income.value = false;
  }

  enableDisableIncome() {
    income.value = !income.value;

    update();
  }

  enableDisableExpense() {
    expense.value = !expense.value;
  }
}
