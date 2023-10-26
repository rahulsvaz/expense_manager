import 'package:expense_manager/view/onBoarding/on_boarding.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Pallete.scaffoldBgColor),
        home: const OnboardingScreen());
  }
}
