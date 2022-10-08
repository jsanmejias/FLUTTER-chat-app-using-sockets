import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/login/login_controller.dart';

import 'package:chat_app/view/common/widgets/custom_buttom.dart';
import 'package:chat_app/view/common/widgets/custom_input.dart';

import 'package:chat_app/view/common/style/style.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            CustomInput(
              icon: Icons.mail_outline,
              placeHolder: 'Email',
              textController: loginController.emailController,
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeHolder: 'Password',
              isPassword: true,
              keyboardType: TextInputType.emailAddress,
              textController: loginController.passwordController,
            ),
            Obx(
              () => SizedBox(
                height: Get.height * 0.08,
                child: CustomButtom(
                  placeHolder: 'Login',
                  onPressed: loginController.runUserLogin(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
