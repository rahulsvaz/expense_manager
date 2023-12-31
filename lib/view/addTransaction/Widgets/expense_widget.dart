import 'package:expense_manager/viewModel/addTransaction/add_transaction_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/date_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/image_controller.dart';
import 'package:expense_manager/viewModel/dopDownController/drop_down_controller.dart';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/addTransaction/Widgets/attachment_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/date_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/dropDown/drop_down_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/howMuch.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/methods/border_decoration_add_field.dart';
import 'package:expense_manager/view/homeScreen/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({super.key});

  @override
  State<ExpenseWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  final transactionController = Get.put(AddTransactionController());
  final dateController = Get.put(DateController());
  final homeScreenController = Get.put(HomeScreenControllers());
  final categoryController = Get.put(DropDownController());
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final attachment = Get.put(PickImageController());

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.10,
          ),
          HowMuchText(width: width, height: height),
          Padding(
            padding: EdgeInsets.only(left: width * 0.17),
            child: TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  color: Pallete.expenseBackGroundColor, fontSize: 80),
              showCursor: true,
              cursorHeight: height * 0.1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                // prefixText: '₹',
                hintText: '₹0',
                hintStyle: TextStyle(
                  fontSize: height * 0.11,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Pallete.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.15),
                topRight: Radius.circular(width * 0.15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                const DropDown(),
                SizedBox(
                  height: height * 0.02,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: width * 0.80),
                  child: TextFormField(
                    style: const TextStyle(color: Pallete.grey),
                    controller: _descriptionController,
                    maxLength: 20,
                    cursorColor: Pallete.grey,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: const TextStyle(color: Pallete.grey),
                      enabledBorder: borderDecoration(),
                      focusedBorder: borderDecoration(),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () async {
                      attachment.imagePath.value =
                          await attachment.pickAttachment();
                    },
                    child: AttachmentButton(
                      width: width * 0.50,
                      height: height,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  const DateButton()
                ]),
                SizedBox(height: height * 0.04),
                LoginSignUpButton(
                  onPressed: () {

                    final totalIncome = homeScreenController.getTotalIncome();
                    final amount = double.parse(_amountController.text.trim());
                    if (totalIncome < amount) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(CustomSnackbar.incomeLowSnackbar);
                    }

                    if (_amountController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(CustomSnackbar.emptyAmountSnackbar);
                    }
                    
                    if(totalIncome>=amount && amount>0){

                    Transactions newTransaction =
                        transactionController.createNewExpense(
                      amount: amount,
                      type: 'expense',
                      dateAndTime: dateController.selectedDate,
                      category:
                          categoryController.selectedCategory.value.toString(),
                      imageUrl: attachment.imagePath.value,
                      description: _descriptionController.text.toString(),
                    );
                    
                    transactionController.addExpense(newTransaction, context);
                    attachment.imagePath.value = '';
                     Get.offAll(
                      const GnavNavigation(),
                    );
                  
                    }
                   
                  },
                  label: 'Add Expense',
                  buttonTextColor: Pallete.white,
                  backgroundColor: Pallete.expenseBackGroundColor,
                ),
  
                // SizedBox(
                //   height: height * 0.11,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
