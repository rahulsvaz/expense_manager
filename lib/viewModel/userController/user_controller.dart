import 'package:expense_manager/model/repository/userModel/user_model.dart';
import 'package:expense_manager/view/homeScreen/home_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  final userBox = Hive.box<User>('UserBox');
  User? newUser;
  RxString imagePath = ''.obs;
  XFile? pickedImage;

  createUser(
      String name, String phone, String email, String age, String imagePath) {
    newUser = User(
        name: name, phone: phone, age: age, email: email, imageUrl: imagePath);
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


deleteUser()async{
  Get.offAll(const HomeScreen());
 await userBox.deleteFromDisk();
}
}
