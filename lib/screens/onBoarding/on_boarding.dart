import 'package:expense_manager/screens/createAccountPage/create_account.dart';
import 'package:expense_manager/screens/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return OnBoardingSlider(
      onFinish: () {
        Get.to(const CreateAccount());
      },
      headerBackgroundColor: Pallete.scaffoldBgColor,
      finishButtonText: 'Create User',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Pallete.buttonColor,
      ),
      centerBackground: true,
      background: [
        Image.asset('assets/images/onboarding/cash_hand.png'),
        Image.asset('assets/images/onboarding/control.png'),
        // Image.asset('assets/images/onboarding/plan.png')
      ],
      totalPage: 2,
      speed: 3,
      pageBodies: [
        Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.57,
            ),
            const Text(
              'Gain total control of \nYour Money',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF212224),
                fontSize: 32,
                fontWeight: FontWeight.w500,
                // height: 0.04,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: height * 0.57),
            const Text(
              'Know where Your \nMoney goes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF212224),
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                // height: 0.04,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
