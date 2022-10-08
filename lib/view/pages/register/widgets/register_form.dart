import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/register/register_controller.dart';

import 'package:chat_app/view/common/widgets/custom_input.dart';
import 'package:chat_app/view/common/widgets/custom_buttom.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (registerController) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textController: registerController.nameController,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: registerController.emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Password',
            isPassword: true,
            textController: registerController.passwordController,
          ),
            Obx(
              () => SizedBox(
                height: Get.height * 0.08,
                child: CustomButtom(
                  placeHolder: 'Create Account',
                  onPressed: registerController.runUserRegistration(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
