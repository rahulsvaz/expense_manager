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
    User currentUser = userBox.getAt(0);
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final userController = Get.put(UserController());
    userController.name.value = currentUser.name;
    userController.age.value = currentUser.age;
    userController.email.value = currentUser.email;
    userController.phone.value = currentUser.phone;
    userController.imagePath.value = currentUser.imageUrl;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
          ),
          Positioned(
            child: Container(
              width: width,
              height: height * 0.27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * 0.35),
                    bottomRight: Radius.circular(width * 0.35),
                  ),
                  color: Pallete.lightGrey),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.14,
            child: Center(
              child: currentUser.imageUrl.isEmpty
                  ? CircleAvatar(
                      backgroundImage: FileImage(File(currentUser.imageUrl)),
                      radius: height * 0.09,
                    )
                  : Obx(
                      () => CircleAvatar(
                        backgroundImage:
                            FileImage(File(userController.imagePath.value)),
                        radius: height * 0.09,
                      ),
                    ),
            ),
          ),
          Positioned(
            top: height * 0.35,
            left: 0,
            right: 0,
            child: Center(
              child: GetBuilder<UserController>(builder: (controller) {
                return Text(
                  controller.name.value,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                      color: Pallete.grey),
                );
              }),
            ),
          ),
          Positioned(
            top: height * .4,
            left: 0,
            right: 0,
            child: Center(
              child: SettingsMenuItems(
                  height: height, width: width, userBox: userBox),
            ),
          ),
          
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.74,
            child: Center(
              child: Text(
                'Expensense',
                style: TextStyle(
                  color: Pallete.grey,
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
                  color: Pallete.grey,
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
                    color: Pallete.grey,
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
