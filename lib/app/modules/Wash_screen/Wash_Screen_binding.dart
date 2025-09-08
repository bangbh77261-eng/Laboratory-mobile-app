
import 'package:get/get.dart';
import 'package:untitled1/app/modules/Wash_screen/Wash_Screen_controller.dart';

class WashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WashScreenController>(() => WashScreenController());
  }
}