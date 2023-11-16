// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_manager/viewModel/homeScreenControllers/home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/addTransaction/Widgets/attachment_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/date_button.dart';
import 'package:expense_manager/view/addTransaction/Widgets/snackBars/snackbar.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/methods/border_decoration_add_field.dart';
import 'package:expense_manager/view/homeScreen/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/addTransaction/add_transaction_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/date_controller.dart';
import 'package:expense_manager/viewModel/addTransaction/image_controller.dart';
import 'package:expense_manager/viewModel/dopDownController/drop_down_controller.dart';

class EditScreen extends StatefulWidget {
  int index;
  double amount;
  String description;
  String imageUrl;
  String type;
  String category;

  EditScreen({
    super.key,
    required this.index,
    required this.amount,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.category,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final homeController = Get.put(HomeScreenControllers());

  final transactionController = Get.put(AddTransactionController());
  final dateController = Get.put(DateController());
  final categoryController = Get.put(DropDownController());
  final attachment = Get.put(PickImageController());
  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.17),
              child: TextFormField(
                controller: _amountController..text = widget.amount.toString(),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Pallete.incomeBackGroundColor, fontSize: 80),
                showCursor: true,
                cursorHeight: height * 0.1,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '₹0',
                  hintStyle: TextStyle(
                    fontSize: height * 0.11,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: width * 0.80),
                  child: TextFormField(
                    style: const TextStyle(color: Pallete.grey),
                    controller: _descriptionController
                      ..text = widget.description,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  ],
                ),
                SizedBox(height: height * 0.04),
                Obx(
                  () => Container(
                    child: attachment.imagePath.value.isNotEmpty
                        ? const Text(
                            'Attachment Added',
                            style: TextStyle(color: Pallete.grey),
                          )
                        : null,
                  ),
                ),
                SizedBox(height: height * 0.04),
                LoginSignUpButton(
                  onPressed: () async {
                    if (_amountController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(CustomSnackbar.emptyAmountSnackbar);
                    }

                    final amount = double.parse(
                      _amountController.text.toString(),
                    );
                    Transactions updated = Transactions(
                        amount: amount,
                        type: widget.type,
                        dateAndTime: dateController.selectedDate,
                        category:widget.category,
                        description:_descriptionController.text,
                        imageUrl:  attachment.imagePath.value);

                    await transactionController.updateTransaction(
                        updated, context, widget.index);

                    Get.offAll(
                      const GnavNavigation(),
                    );
                    attachment.imagePath.value = '';
                  },
                  label: 'Update',
                  buttonTextColor: Pallete.white,
                  backgroundColor: Pallete.incomeBackGroundColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
