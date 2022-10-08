import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/chat/chat_controller.dart';

import 'package:chat_app/config/routes/app_routes.dart';
import 'package:chat_app/view/common/style/style.dart';
import 'package:chat_app/view/helpers/string_mod.dart';

import 'package:chat_app/domain/models/user/user.dart';

class ChatPageAppBar extends StatelessWidget with PreferredSizeWidget {
  ChatPageAppBar({super.key});

  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    final User userTo = chatController.userTo;
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      ),
      titleSpacing: -15,
      title: ListTile(
        onTap: () => Get.toNamed(AppRoutes.userToProfile),
        leading: CircleAvatar(
          backgroundColor: electricPurple,
          child: Text(
            userTo.name.substring(0, 2).toTitleCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          userTo.name.toTitleCase(),
          style: TextStyle(
            letterSpacing: 1,
            fontStyle: FontStyle.italic,
            fontSize: Get.height * 0.024,
            fontWeight: FontWeight.w800,
            color: pointer,
          ),
        ),
        subtitle: Text(
          "View profile",
          style: TextStyle(
            fontSize: Get.height * 0.018,
            fontWeight: FontWeight.w500,
            color: lightPurple,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      toolbarHeight: Get.height * 0.15,
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.1);
}
