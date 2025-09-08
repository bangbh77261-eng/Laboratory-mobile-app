import 'package:untitled1/app/modules/Home_Screen/Home_Screen_controller.dart';
import 'package:get/get.dart';
class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}