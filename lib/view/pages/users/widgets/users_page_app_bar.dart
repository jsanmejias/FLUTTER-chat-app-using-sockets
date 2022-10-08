import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';

import 'package:chat_app/config/routes/app_routes.dart';
import 'package:chat_app/view/common/style/style.dart';
import 'package:chat_app/view/helpers/string_mod.dart';
import 'package:chat_app/view/helpers/alerts/logout_decision_alert.dart';

class UsersPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const UsersPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (usersController) => AppBar(
        centerTitle: true,
        elevation: 1,
        leadingWidth: Get.width * 0.11,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.05),
          child: GestureDetector(
            onTap: () => logoutDecisionAlert(context),
            child: const Image(
              image: AssetImage('assets/logout.png'),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.loggedUserProfile),
          child: Text(usersController.getLoggedUserName().toTitleCase(),
              style:
                  TextStyle(color: letterColor, fontSize: Get.height * 0.03)),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          Obx(
            () => Container(
              height: Get.height * 0.018,
              width: Get.width * 0.09,
              margin: EdgeInsets.only(right: Get.width * 0.05),
              child: usersController.getServerStatus() == "Online"
                  ? Image(
                      image: const AssetImage('assets/connected_icon.png'),
                      height: Get.height * 0.20,
                    )
                  : Image(
                      image: const AssetImage('assets/disconnected_icon.png'),
                      height: Get.height * 0.20,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.07);
}
