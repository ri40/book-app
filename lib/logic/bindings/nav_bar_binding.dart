import 'package:get/get.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NavBarController());
  }
}
