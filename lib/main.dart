import 'package:expense_manager/view/screens/g_nav.dart';
import 'package:expense_manager/view/screens/login_screen.dart';
import 'package:expense_manager/view/screens/start_screen.dart';
import 'package:expense_manager/viewModel/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Pallete.scaffoldBgColor),
        home: const StartScreen());
  }
}
