// import 'package:expense_manager/viewModel/addTransaction/transaction_screen_controller.dart';
// import 'package:expense_manager/view/addTransaction/Widgets/expense_widget.dart';
// import 'package:expense_manager/view/addTransaction/Widgets/income_widget.dart';
// import 'package:expense_manager/view/constant/colors/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddTransaction extends StatefulWidget {
//   const AddTransaction({super.key});

//   @override
//   State<AddTransaction> createState() => _AddTransactionState();
// }

// class _AddTransactionState extends State<AddTransaction> {
//   Widget expenseScreen = const ExpenseWidget();
//   Widget incomeScreen = const IncomeWidget();

//   @override
//   Widget build(BuildContext context) {
//     final widgetController = Get.put(TransactionScreenController());
//     final height = MediaQuery.sizeOf(context).height;
//     final width = MediaQuery.sizeOf(context).width;

//     return Scaffold(
//       body: Obx(
//         () => AnimatedContainer(
//           height: Get.height,
//           duration: const Duration(
//               milliseconds: 1000), // Adjust the duration as needed
//           decoration: BoxDecoration(
//             color: widgetController.activeWidget.value == 'expense-widget'
//                 ? Pallete.incomeBackGroundColor
//                 : Pallete.expenseBackGroundColor,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.13,
//                 ),
//                 Obx(
//                   () => TextButton(
//                     onPressed: () {
//                       if (widgetController.activeWidget.value ==
//                           'expense-widget') {
//                         widgetController.changeActiveWidget();
//                       } else {
//                         widgetController.changeToExpense();
//                       }
//                     },
//                     child: Text(
//                       widgetController.activeWidget.value == 'expense-widget'
//                           ? 'Add Expense Details??'
//                           : 'Add Income Details??',
//                       style: TextStyle(
//                           color: Pallete.white, fontSize: width * 0.04),
//                     ),
//                   ),
//                 ),
//                 Obx(() =>
//                     widgetController.activeWidget.value == 'expense-widget'
//                         ? incomeScreen
//                         : expenseScreen),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //

