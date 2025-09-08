
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WashScreenController extends GetxController {
  late final WebViewController webViewController;
  final String userId = Get.arguments?['userId'] ?? '';
  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://ros.reginamiracle.com:3016/login?username=$userId&password=123456"));      
  }  
}