import 'package:expense_manager/view/screens/login_screen.dart';
import 'package:expense_manager/trash/sign_up_screen.dart';
import 'package:expense_manager/viewModel/widgets/size.dart';
import 'package:expense_manager/viewModel/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/Illustration.png',
                    height: Get.height * 0.3),
              ),
              const Center(
                child: Text(
                  'Gain Total Control\nOf Your Money',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, height: 1.4),
                ),
              ),
              const Height40(),
              const Text(
                'Become your own money manager and \n make every rupee count',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              const Height50(),
              LoginSignUpButton(
                onPressed: () {
                  Get.to(const LoginScreen());

                },
                label: 'Login',
                buttonTextColor: Pallete.white,
                backgroundColor: Pallete.buttonColor,
              ),
              const Height10(),
              LoginSignUpButton(
                onPressed: () {
                  Get.to(const SignUpScreen());
                },
                label: 'Sign UP',
                buttonTextColor: Pallete.purple,
                backgroundColor: Pallete.lightPurple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
