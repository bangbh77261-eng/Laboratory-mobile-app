
import 'package:get/get.dart';
import 'package:untitled1/app/modules/Test_Screen/Demo_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestController>(() => TestController());
  }
}