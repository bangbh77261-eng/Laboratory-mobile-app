import 'package:untitled1/app/modules/Home_Screen/Home_Screen_binding.dart';
import 'package:untitled1/app/modules/Home_Screen/Home_Screen_views.dart';
import 'package:untitled1/app/modules/Login_Screen/Login_Screen_bindings.dart';
import 'package:untitled1/app/modules/Login_Screen/Login_Screen_views.dart';
import 'package:untitled1/app/modules/Test_Screen/Demo_binding.dart';
import 'package:untitled1/app/modules/Test_Screen/Demo_view.dart';
import 'package:untitled1/app/modules/Wash_screen/Wash_Screen_binding.dart';
import 'package:untitled1/app/modules/Wash_screen/Wash_Screen_views.dart';
import 'package:untitled1/app/routers/app_router.dart';
import 'package:get/get.dart';
class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => LoginScreenViews(),
      binding: LoginScreenBindings(),
    ),
    GetPage(
      name: Routes.HomeScreen,
      page: () =>  HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.WashScreen,
      page: () =>  WashScreenView(),
      binding: WashScreenBinding(),
    ),
    GetPage(
      name: Routes.TestScreen,
      page: () =>  TestView(),
      binding: TestBinding(),
    ),
  ];
}