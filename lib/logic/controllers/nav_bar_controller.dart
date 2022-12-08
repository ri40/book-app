import 'package:get/get.dart';

class NavBarController extends GetxController {
  int currentIndex = 0;

  void selectedPage(index) {
    currentIndex = index;
    update();
  }
}