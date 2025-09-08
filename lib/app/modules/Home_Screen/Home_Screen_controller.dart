import 'package:get/get.dart';
import 'package:untitled1/data/models/user_test.dart';
class HomeScreenController extends GetxController {
 var user = Rxn<UserTest>();
 var date = DateTime.now().obs;
   @override
void onInit() {
  super.onInit();
  if (Get.arguments != null && Get.arguments is UserTest) {
    user.value = Get.arguments as UserTest;
  }
}
}