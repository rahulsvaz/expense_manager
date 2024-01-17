import 'dart:io';
import 'package:expense_manager/model/repository/budget/budget_model.dart';
import 'package:expense_manager/model/repository/transactionsModel/transaction_model.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/splash_screen/splash_screen.dart';
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
  Hive.registerAdapter(BudgetModelAdapter());
  await Hive.openBox<BudgetModel>('BudgetBox');
  await Hive.openBox<User>('UserBox');
  await Hive.openBox<Transactions>('TransactionBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
        scaffoldBackgroundColor: Pallete.white,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
     
    );
  }
}
