import 'dart:io';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/settings/widgets/menu_item.dart';
import 'package:expense_manager/viewModel/userController/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Box userBox = Hive.box<User>('UserBox');
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final userController = Get.put(UserController());


      return Scaffold(
        body: Stack(
          children: [

            Positioned(
              left: 0,
              right: 0,
              top: height * 0.74,
              child: Center(
                child: Text(
                  'Expensense',
                  style: TextStyle(
                    color: ColorsClass.grey,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: height * 0.80,
              child: Center(
                child: Text(
                  'By',
                  style: TextStyle(
                    color: ColorsClass.grey,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: height * 0.85,
              child: Center(
                child: Text(
                  'Rahul',
                  style: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
