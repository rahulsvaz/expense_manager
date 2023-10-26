import 'package:expense_manager/view/screens/home_screen.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/validators.dart';
import 'package:expense_manager/viewModel/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/widgets/size.dart';
import 'package:expense_manager/viewModel/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              CircleAvatar(
                radius: height * 0.08,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const UserTextfield(
                validator: nameValidator,
                obscureText: false,
                label: 'Name',
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const UserTextfield(
                validator: emailValidator,
                obscureText: false,
                label: 'Email',
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const UserTextfield(
                obscureText: false,
                validator: ageValidator,
                label: 'Age',
              ),
              SizedBox(
                height: height * 0.04,
              ),
              LoginSignUpButton(
                  onPressed: () {
                    Get.to(const HomeScreen());
                    if (formKey.currentState!.validate()) {
                      Get.back();
                    }
                  },
                  label: 'Create User',
                  buttonTextColor: Pallete.white,
                  backgroundColor: Pallete.buttonColor),
            ],
          ),
        ),
      ),
    ));
  }
}
