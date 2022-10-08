import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';

import 'package:chat_app/view/helpers/string_mod.dart';
import 'package:chat_app/view/common/style/style.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (usersController) => Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.05,
          top: Get.height * 0.07,
          right: Get.width * 0.05,
          bottom: 0,
        ),
        child: Column(
          children: [
            Text(
              'Hey, ${usersController.getLoggedUserName().toTitleCase()}!',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.w600,
                color: electricPurple,
              ),
            ),
            SizedBox(height: Get.height * 0.025),
            Card(
              color: othersBubble,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Username",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: Get.height * 0.020,
                              fontWeight: FontWeight.w600,
                              color: darkBlue,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            usersController.getLoggedUserName().toTitleCase(),
                            style: TextStyle(
                              // fontStyle: FontStyle.italic,
                              fontSize: Get.height * 0.024,
                              fontWeight: FontWeight.w600,
                              color: darkPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: Get.height * 0.020,
                              fontWeight: FontWeight.w600,
                              color: darkBlue,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            usersController.getLoggedUserEmail().toTitleCase(),
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              // fontStyle: FontStyle.italic,
                              fontSize: Get.height * 0.024,
                              fontWeight: FontWeight.w600,
                              color: darkPurple,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
