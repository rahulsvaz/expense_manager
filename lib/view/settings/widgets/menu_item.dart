import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/ediAccount.dart/edit_Account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';

class SettingsMenuItems extends StatelessWidget {
  const SettingsMenuItems({
    super.key,
    required this.height,
    required this.width,
    required this.userBox,
  });

  final double height;
  final double width;
  final Box userBox;

  @override
  Widget build(BuildContext context) {
    Box userBox = Hive.box<User>('UserBox');

    User currentUser = userBox.getAt(0);

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.04)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(height * .2))),
        width: width * 0.8,
        height: height * .20,
        child: ListView(
          children: [
            // MENU ITEMS
            ListTile(
              onTap: () {
                Get.to(() => EditAccount(
                    name: currentUser.name,
                    phone: currentUser.phone,
                    age: currentUser.age,
                    email: currentUser.email,
                    imageUrl: currentUser.imageUrl));
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.08, vertical: height * 0.01),
              leading: IconButton(
                  onPressed: () {

                     Get.to(() => EditAccount(
                    name: currentUser.name,
                    phone: currentUser.phone,
                    age: currentUser.age,
                    email: currentUser.email,
                    imageUrl: currentUser.imageUrl));
                    
                  }, icon: const Icon(IconlyLight.edit)),
              trailing: Text(
                'Edit Profile Information',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: width * 0.03, fontWeight: FontWeight.bold),
              ),
            ),
            //  NOTIFICATION
            //   ListTile(
            //     contentPadding: EdgeInsets.symmetric(
            //         horizontal: width * 0.08, vertical: height * 0.00),
            //     leading: IconButton(
            //         onPressed: () {}, icon: const Icon(IconlyLight.notification)),
            //     trailing: Text(
            //       'Change Notification Settings',
            //       style: TextStyle(
            //           fontSize: width * 0.03, fontWeight: FontWeight.bold),
            //     ),
            //  ),
            // ListTile(
            //   contentPadding: EdgeInsets.symmetric(
            //       horizontal: width * 0.08, vertical: height * 0.00),
            //   leading: IconButton(
            //       onPressed: () {
            //         Get.defaultDialog(
            //           middleText: 'Your all data  will be deleted',
            //           confirm: TextButton(
            //             onPressed: () async {
            //                 Get.offAll(const HomeScreen());
            //               await user.deleteUser();

            //               await transaction.deleteAllTransaction();
            //               // await user.deleteUser();
            //               // Get.offAll(const CreateAccount());
            //             },
            //             child: const Text('Yes'),
            //           ),
            //           titlePadding: const EdgeInsets.all(20),
            //           title: 'Are You Sure To Logout',
            //           cancel: TextButton(
            //             onPressed: () {
            //               Get.back();
            //             },
            //             child: const Text('NO'),
            //           ),
            //         );
            //       },
            //       icon: const Icon(IconlyLight.delete)),
            //   trailing: Text(
            //     'Delete All Data And Logout',
            //     style: TextStyle(
            //         fontSize: width * 0.03, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
