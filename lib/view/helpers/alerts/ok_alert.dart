import 'dart:io';
import 'package:chat_app/view/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/widgets/custom_buttom.dart';

okAlert(BuildContext context, String title, String subtitle) async {
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
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.height * 0.026,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: Colors.black54, fontSize: Get.height * 0.022),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                      height: Get.height * 0.06,
                      child: CustomButtom(
                        backgroundColor: electricPurple,
                          placeHolder: 'Ok',
                          onPressed: () => Navigator.pop(context))),
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
        title,
        style: TextStyle(color: Colors.black87, fontSize: Get.height * 0.022),
      ),
      content: Text(
        subtitle,
        style: TextStyle(color: Colors.black87, fontSize: Get.height * 0.022),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          isDefaultAction: true,
          child: const Text('Ok'),
        )
      ],
    ),
  );
}
