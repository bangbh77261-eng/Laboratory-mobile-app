


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:untitled1/data/models/message_test.dart';
import 'package:untitled1/data/models/user_test.dart';
import 'package:untitled1/data/reponsitory/user_service.dart';

class TestController extends GetxController {
  final UserServiceMessage _messageService = UserServiceMessage();
  var messages = <MessageUser>[].obs;
  var isLoading = true.obs;
  final messageContent = TextEditingController();
  var user = Rxn<UserTest>();
  var date = DateTime.now().obs;

  @override
  void onInit() {
      if (Get.arguments != null && Get.arguments is UserTest) {
      user.value = Get.arguments as UserTest;
    }
    super.onInit();
    loadMessages();
  }

  Future<void> loadMessages() async {
    try {
      isLoading.value = true;
      final data = await _messageService.getAllData();
      messages.assignAll(data);
    } catch (e) {
      print("Error loading messages: $e");
    } finally {
      isLoading.value = false;
    }
  }
Future<void> sendMessage() async {
  if (messageContent.text.trim().isEmpty) return;
  //var messages = await  _messageService.getAll();
  final newMessage = MessageUser(
      userName: user.value?.username,   
    content: messageContent.text.trim(),
  );

  try {
    final created = await _messageService.createNewData(newMessage);
    messages.add(created);
  } catch (e) {
    print("Error posting message: $e");
  }

  messageContent.clear();
}
}