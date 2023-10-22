import 'package:get/get.dart';

class TextfieldController extends GetxController {
  var isObscured = true.obs;

  surffixChange(surffix) {
isObscured.value = !isObscured.value;
  }
}
