import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/constants/methods/textStyle.dart';
import 'package:expense_manager/viewModel/controllers/textfieldController.dart';
import 'package:expense_manager/viewModel/constants/methods/validators.dart';
import 'package:expense_manager/viewModel/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/widgets/size.dart';
import 'package:expense_manager/viewModel/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextfieldController surffixController =
        Get.put(TextfieldController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: appBartTextStyle(),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: UserTextfield(
                    validator: nameValidator,
                    obscureText: false,
                    label: 'Name',
                  ),
                ),
                const Height20(),
                const UserTextfield(
                  validator: emailValidator,
                  obscureText: false,
                  label: 'Email',
                ),
                const Height20(),
                Obx(
                  () => UserTextfield(
                    validator: passwordValidator,
                    obscureText: surffixController.isObscured.value,
                    label: 'Password',
                    surffix: IconButton(
                      onPressed: () {
                        surffixController
                            .surffixChange(surffixController.isObscured.value);
                      },
                      icon: Icon(surffixController.isObscured.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Pallete.grey,
                    ),
                  ),
                ),
                const Height20(),
                LoginSignUpButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.snackbar('user created', 'done');
                        
                      }
                    },
                    label: 'Sign Up',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.buttonColor),
                const Height30(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        'Already Have An Account?',
                        style: haveAccountStyle(),
                      )),
                      const Width10(),
                      Text(
                        'Login',
                        style: backToLoginStyle(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
