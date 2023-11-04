import 'dart:io';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/onBoarding/on_boarding.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter(TransactionsAdapter());
  await Hive.openBox<User>('UserBox');
  await Hive.openBox<Transactions>('TransactionBox');
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expensense',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
       useMaterial3: true, scaffoldBackgroundColor: Pallete.scaffoldBgColor),
      home: Hive.box<User>('UserBox').isEmpty
          ? const OnboardingScreen()
          : const GnavNavigation(),
    );
  }
}
