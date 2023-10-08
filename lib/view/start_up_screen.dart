import 'package:expense_manager/view/size.dart';
import 'package:expense_manager/view/widgets/login_sign_up_button.dart';
import 'package:expense_manager/viewModel/constants/colors.dart/colors.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/Illustration.png'),
          ),
          const Center(
            child: Text(
              'Gain Total Control',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Height10(),
          const Center(
            child: Text(
              'Of Your Money',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Height30(),
          const Text(
            'Become your own money manager and \n make every rupee count',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
         const  Height50(),
          LoginSignUpButton(
            onPressed: () {},
            label: 'Login',
            buttonTextColor: Pallete.white,
            backgroundColor: Pallete.buttonColor,
          ),
          const Height20(),
          LoginSignUpButton(
            onPressed: () {},
            label: 'Sign UP',
            buttonTextColor: Pallete.purple,
            backgroundColor: Pallete.lightPurple,
          )
        ],
      ),
    );
  }
}
