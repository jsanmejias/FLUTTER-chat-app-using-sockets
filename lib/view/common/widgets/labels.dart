import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/style.dart';
import 'package:chat_app/config/routes/app_routes.dart';

class Labels extends StatelessWidget {
  final bool isLoginPage;

  const Labels({super.key, this.isLoginPage = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isLoginPage ? 'Dont\'t have an account?' : 'Already have an account?',
          style:  TextStyle(
              color: Colors.black54, fontSize: Get.height * 0.02, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            Get.offAndToNamed(
                isLoginPage ? AppRoutes.register : AppRoutes.login);
          },
          child: Text(
            isLoginPage ? 'Create one now!' : 'Log now!',
            style:  TextStyle(
                color: darkBlue,
                fontSize: Get.height * 0.026,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
