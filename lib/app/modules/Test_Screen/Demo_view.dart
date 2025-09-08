import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/app/modules/Test_Screen/Demo_controller.dart';


class TestView extends GetView<TestController> {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Box Chat")),
      body: ListView(
        children: [
          Container(
            height: Get.height*0.8,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return ListTile(
                    title: Text(msg.userName ?? "Unknown"),
                    subtitle: Text(msg.content ?? ""),
                    // trailing: Text(msg.sendTime ?? ""),
                  );
                },
              );
            }),
          ),
          Row(
            children: [
               Expanded(
                 child: TextField(
                      controller: controller.messageContent,
                      decoration: const InputDecoration(
                        hintText: "Nhập tin nhắn...",
                        border: InputBorder.none,
                      ),
                           ),
               ),
              IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    controller.sendMessage();
                  },
                ),
            ],
          )
         
        ],
      ),
    );
  }
}