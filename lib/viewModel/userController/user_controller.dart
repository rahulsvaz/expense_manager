

import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/NavigationBar/g_nav.dart';
import 'package:expense_manager/view/homeScreen/home_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  Box userBox = Hive.box<User>('UserBox');

RxString name =''.obs;
RxString age =''.obs;
RxString email =''.obs;
RxString phone =''.obs;

  

  RxString imagePath = ''.obs;
  XFile? pickedImage;

  createNewUser(
      String name, String phone, String age, String email, String imageUrl) {
    User newUser = User(
        name: name, phone: phone, age: age, email: email, imageUrl: imageUrl);

    userBox.add(newUser).then((value) => Get.offAll(const GnavNavigation()));
  }

  saveUser(User newUser) async {
    await userBox.add(newUser);
  }

  pickUserImage() async {
    final ImagePicker imagePicker = ImagePicker();
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath.value = pickedImage!.path.toString();
  }

  pickUserImageWithCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    imagePath.value = pickedImage!.path.toString();
  }

  RxDouble elevation = 10.0.obs;
  changeElevation() {
    elevation.value = 5.0;
  }

  deleteUser() async {
    Get.offAll(const HomeScreen());
    await userBox.deleteFromDisk();
  }

  updateUser(User updated) async {
    await userBox.put(0, updated);
    Get.back();
  }
}
