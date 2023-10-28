import 'dart:io';
import 'package:expense_manager/model/repository/userModel/contollers/user_controller.dart';
import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:expense_manager/view/createAccountPage/create_account.dart';
import 'package:expense_manager/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    Box userBox = Hive.box<User>('UserBox');
    final elevationControl = Get.put(UserController());
    User currentUser = userBox.getAt(0);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  // height: height * 0.2,
                  // width: width * 0.2,
                  child: CircleAvatar(
                    radius: height * 0.04,
                    backgroundImage: FileImage(
                      File(currentUser.imageUrl),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.3,
                  width: width * 0.04,
                ),
                Column(
                  children: [
                    const Text('UserName',
                        style: TextStyle(color: Pallete.grey)),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(currentUser.name,
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: width * .1,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              ],
            ),
          ),
// big card

          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              width: width * .9,
              height: height * 0.5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: elevationControl.elevation.value,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/wallet.png',
                              height: height * 0.1,
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Text(
                              'Account',
                              style: textStyleSettings(height),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          elevation: 10,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/settings.png',
                                height: height * 0.1,
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Text(
                                'Settings',
                                style: textStyleSettings(height),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            middleText: 'Your all data  will be deleted',
                            confirm: TextButton(
                              onPressed: () {
                              
                                Get.offAll(
                                  const CreateAccount(),
                                );
                                  userBox.delete(0);
                              },
                              child: const Text('Yes'),
                            ),
                            titlePadding: const EdgeInsets.all(20),
                            title: 'Are You Sure To Logout',
                            cancel: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('NO'),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/logout.png',
                                height: height * 0.1,
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Text(
                                'Log out',
                                style: textStyleSettings(height),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle textStyleSettings(double height) =>
      TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.bold);
}
