import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/homeScreen/widgets/login_sign_up_button.dart';
import 'package:flutter/material.dart';

class AddBudgetScreen extends StatelessWidget {
  const AddBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final budgetAmountController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ENTER YOUR BUDGET AMOUNT',
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
              child: TextFormField(
                cursorColor: Pallete.grey,
                style: const TextStyle(color: Pallete.grey),
                controller: budgetAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  
                  hintText: 'Amount',
                  enabledBorder: borderDecoration(),
                  focusedBorder: borderDecoration(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: LoginSignUpButton(
                    onPressed: () {},
                    label: 'Save',
                    buttonTextColor: Pallete.lightPurple,
                    backgroundColor: Pallete.buttonColor)),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Pallete.grey),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
  }
}
