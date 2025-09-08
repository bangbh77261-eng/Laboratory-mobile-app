
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/app/modules/Wash_screen/Wash_Screen_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WashScreenView extends GetView<WashScreenController> {
  const WashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ROS Login"),
        leading: IconButton(
          onPressed: ()async{
              Get.back();
        }, icon: Icon(Icons.arrow_back)),
        ),
      body:  WebViewWidget(
        controller: controller.webViewController,
      ),
    );
  }
}
  