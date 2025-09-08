import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/app/modules/Home_Screen/Home_Screen_binding.dart';
import 'package:untitled1/app/modules/Home_Screen/Home_Screen_views.dart';
import 'package:untitled1/data/reponsitory/user_service.dart';
class LoginScreenController extends GetxController {
  var isLoading = false.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //final UserService _userService = UserService();
 final UserServiceTest _userService = UserServiceTest();
  Future<void> loadHomePage() async {
    isLoading.value = true;

    final username = usernameController.text.toString();
    final password = passwordController.text.toString();

   try {
  final user = await _userService.getByName(username);
  isLoading.value = false;

  if (user.passwordHash == password) {
    debugPrint("Login OK -> chuyển màn Home");
    Get.offAll(
      () => HomeScreenView(),
      binding: HomeScreenBinding(),
      arguments: user,
    );
  } else {
    debugPrint("Sai mật khẩu");
    Get.snackbar("Error", "Sai mật khẩu",
        snackPosition: SnackPosition.BOTTOM);
  }
} catch (e) {
  debugPrint("Login lỗi: $e");
  isLoading.value = false;
  Get.snackbar("Error", "Không tìm thấy tài khoản",
      snackPosition: SnackPosition.BOTTOM);
}
  }
}