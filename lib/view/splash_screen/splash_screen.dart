import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/onBoarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Hive.box<User>('UserBox').isEmpty
              ? const OnboardingScreen()
              : const GnavNavigation(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/splash_animation.json'),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 30),
                duration: const Duration(seconds: 1),
                builder: (context, object, child) {
                  return Text(
                    'E X P E N S E N S E',
                    style: TextStyle(
                        fontSize: double.parse(object.toString()),
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  );
                })
          ],
        ),
      ),
    );
  }
}
