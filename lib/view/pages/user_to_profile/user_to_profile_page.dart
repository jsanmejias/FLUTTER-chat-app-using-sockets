import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/chat/chat_controller.dart';

import 'package:chat_app/view/common/style/style.dart';
import 'package:chat_app/view/helpers/string_mod.dart';

import 'package:chat_app/view/pages/user_to_profile/widgets/user_to_profile_page_app_bar.dart';

class UserToProfile extends StatelessWidget {
  const UserToProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (chatController) => SafeArea(
        child: Scaffold(
          appBar: const UserToProfilePageAppBar(),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.1, horizontal: Get.width * 0.2),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: Get.height * 0.1,
                    backgroundColor: electricPurple,
                    child: Text(
                      chatController.userTo.name
                          .substring(0, 2)
                          .toTitleCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    chatController.userTo.name.toTitleCase(),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: Get.height * 0.04,
                      fontWeight: FontWeight.w600,
                      color: pointer,
                    ),
                  ),
                  Text(
                    chatController.userTo.email,
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w500,
                      color: lightPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
