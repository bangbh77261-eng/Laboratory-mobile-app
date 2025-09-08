import 'package:flutter/material.dart';
import 'package:untitled1/app/constant/style.dart';
import 'package:untitled1/app/modules/Login_Screen/Login_screen_controller.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/languages/services/language_controller.dart';

class LoginScreenViews extends GetView<LoginScreenController> {
  const LoginScreenViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 800;

          Widget content = isWide
              ? Row(
                  children: [
                    Expanded(flex: 45, child: _leftWidgetCompanyDetail(context)),
                    Expanded(flex: 55, child: _rightWidgetLoginDetail(context)),
                  ],
                )
              : Column(
                  children: [
                    Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                  _leftWidgetCompanyDetail(context),
                  _rightWidgetLoginDetail(context),
              ],
            );
                    }
                    ),
                    
                  ],
                );

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: content,
            ),
          );
        },
      ),
    );
  }

  Widget _leftWidgetCompanyDetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.pink.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // AppImage(
          //   imagePath: AppImages.company_logo,
          //   borderRadius: BorderRadius.circular(12),
          // ),
          const Gap(230),
          Text(
            "welcome".tr,
            style: AppTextStyles.header(context).copyWith(color: Colors.white),
          ),
          const Gap(12),
          Text(
            "welcome_message".tr,
            style: AppTextStyles.header(context)
                .copyWith(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "company_name".tr,
              style: AppTextStyles.header(context).copyWith(
                color: Colors.white,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightWidgetLoginDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Obx(
              () => DropdownButton<String>(
                value: LanguageController.to.currentLanguage.value,
                underline: const SizedBox(),
                onChanged: (value) {
                  if (value != null) {
                    LanguageController.to.changeLanguage(value);
                  }
                },
                items: LanguageController.to.supportedLanguages
                    .map(
                      (lang) => DropdownMenuItem<String>(
                        value: lang['code']!,
                        child: Row(
                          children: [
                            Text(lang['flag']!, style: const TextStyle(fontSize: 18)),
                            const SizedBox(width: 8),
                            Text(lang['name']!),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const Gap(40),
          Text("login_screen".tr, style: AppTextStyles.header(context)),
          const Gap(10),
          Text(
            'login_caption'.tr,
            style: AppTextStyles.caption(context).copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const Gap(40),
          _buildTextField(context, 'user_name_login'.tr),
          const Gap(20),
          _buildTextField(context, 'password_login'.tr, isPassword: true),
          const Gap(30),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.loadHomePage();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("login_button".tr),
              ),
            ),
       
      //      Obx(() {
      //   if (controller.users.isEmpty) {
      //     return const Center(child: CircularProgressIndicator());
      //   }
      //   return ListView.builder(
      //     shrinkWrap: true,
      //     physics: const NeverScrollableScrollPhysics(),
      //     itemCount: controller.users.length,
      //     itemBuilder: (context, index) {
      //       final user = controller.users[index];
      //       return Card(
      //         child: ListTile(
      //           leading: CircleAvatar(child: Text(user.username[0].toUpperCase())),
      //           title: Text(user.username),
      //           subtitle: Text(user.email),
      //         ),
      //       );
      //     },
      //   );
      // }),
        ],
      ),
    );
  }
  Widget _buildTextField(BuildContext context, String title,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.header(context).copyWith(fontSize: 14),
        ),
        const Gap(12),
        TextField(
          controller: isPassword
              ? controller.passwordController
              : controller.usernameController,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(isPassword ? Icons.lock : Icons.person),
          ),
        ),
      ],
    );
  }
}
