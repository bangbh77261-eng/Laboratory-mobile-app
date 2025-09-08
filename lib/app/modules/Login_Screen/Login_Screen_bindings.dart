import 'package:untitled1/app/modules/Login_Screen/Login_screen_controller.dart';
import 'package:get/get.dart';
class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}