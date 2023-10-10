import 'package:expense_manager/view/screens/home_screen.dart';
import 'package:expense_manager/view/screens/sign_up_screen.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:expense_manager/viewModel/methods/textStyle.dart';
import 'package:expense_manager/viewModel/controllers/textfieldController.dart';
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
    final TextfieldController surffixController =
        Get.put(TextfieldController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
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
                const Height100(),
                const Height100(),
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
                const Height40(),
                LoginSignUpButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                      if (formKey.currentState!.validate()) {
                        Get.back();
                      }
                    },
                    label: 'LogIn',
                    buttonTextColor: Pallete.white,
                    backgroundColor: Pallete.buttonColor),
                const Height30(),
                Text(
                  'Forgot Password ?',
                  style: forgotPasswordStyle(),
                ),
                const Height20(),
                GestureDetector(
                  onTap: () {
                    Get.to(const SignUpScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        "Don't Have An Account?",
                        style: haveAccountStyle(),
                      )),
                      const Width10(),
                      Text(
                        'Sign Up',
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
