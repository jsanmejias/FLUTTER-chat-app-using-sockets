import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/style.dart';

class UserToProfilePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const UserToProfilePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: Text('Contact Info',
          style: TextStyle(color: letterColor, fontSize: Get.height * 0.03)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.07);
}
