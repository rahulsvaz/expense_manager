
import 'package:get/get.dart';

class GnavController extends GetxController {
  RxInt currentIndex = 0.obs;

  changeIndex(int index) {
  currentIndex.value = index;
}

}

