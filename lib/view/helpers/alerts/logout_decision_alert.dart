import 'dart:io';

import 'package:chat_app/view/common/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';

import 'package:chat_app/view/common/widgets/custom_buttom.dart';

logoutDecisionAlert(BuildContext context) async {
  final UsersController usersController = Get.find();

  if (Platform.isAndroid) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            insetPadding: const EdgeInsets.all(10),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Log out',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.height * 0.026,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Do you want to log out?',
                    style: TextStyle(
                        color: Colors.black54, fontSize: Get.height * 0.022),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                            height: Get.height * 0.06,
                            child: CustomButtom(
                                placeHolder: 'No',
                                onPressed: () => Navigator.pop(context))),
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Expanded(
                        child: SizedBox(
                          height: Get.height * 0.06,
                          child: CustomButtom(
                            backgroundColor: electricPurple,
                              placeHolder: 'Yes',
                              onPressed: () => {
                                    Get.back(),
                                    usersController.logOut(),
                                  }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(
        'Log out',
        style: TextStyle(color: Colors.black87, fontSize: Get.height * 0.022),
      ),
      content: Text(
        'Do you want to log out?',
        style: TextStyle(color: Colors.black87, fontSize: Get.height * 0.022),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          isDefaultAction: true,
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          onPressed: () => {
            Get.back(),
            usersController.logOut(),
          },
          isDefaultAction: true,
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    ),
  );
}
