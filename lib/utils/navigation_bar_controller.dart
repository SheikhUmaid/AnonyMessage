import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt index = 1.obs;

  void indexSetter(int newIndex) {
    index.value = newIndex;
  }
}
