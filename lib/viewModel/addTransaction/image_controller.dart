import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  RxString imagePath = ''.obs;


  // I M A G E      P I C K E R

  Future pickAttachment() async {
    final imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
     return pickedImage!.path.toString();
    
  }
}
