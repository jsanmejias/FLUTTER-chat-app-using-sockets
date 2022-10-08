import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/style.dart';
import 'package:chat_app/view/helpers/string_mod.dart';

import 'package:chat_app/domain/models/user/user.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';

class UserListTile extends StatelessWidget {
  final User user;

  const UserListTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (userController) => ListTile(
        onTap: () => userController.goToChat(user),
        leading: CircleAvatar(
          backgroundColor: electricPurple,
          child: Text(
            user.name.substring(0, 2).toTitleCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          user.name.toTitleCase(),
          style: TextStyle(
            letterSpacing: 1,
            fontStyle: FontStyle.italic,
            fontSize: Get.height * 0.024,
            fontWeight: FontWeight.w800,
            color: pointer,
          ),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(
            fontSize: Get.height * 0.018,
            fontWeight: FontWeight.w500,
            color: lightPurple,
          ),
        ),
        
        trailing: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.chat_bubble_outline,
                color: darkBlue,
                size: Get.height * 0.030,
              ),
            ),
            Positioned(
              right: 1,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: user.online ? chatGreen : chatRed,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
