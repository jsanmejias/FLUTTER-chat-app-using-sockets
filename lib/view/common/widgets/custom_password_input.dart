import 'package:chat_app/view/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordInput extends StatelessWidget {
  final TextEditingController textController;
  CustomPasswordInput({super.key, required this.textController});

  RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: textFieldBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(
                0.1,
              ),
              offset: const Offset(0, 5),
              blurRadius: 5),
        ],
      ),
      child: Obx(
        () => TextField(
          style: TextStyle(fontSize: Get.height * 0.022, color: letterColor),
          controller: textController,
          autocorrect: false,
          obscureText: !isPasswordVisible.value,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                size: Get.height * 0.035,
              ),
              suffixIcon: IconButton(
                  onPressed: () =>
                      isPasswordVisible.value = !isPasswordVisible.value,
                  icon: isPasswordVisible.value
                      ? const Icon(Icons.visibility, color: electricPurple)
                      : const Icon(Icons.visibility_off, color: electricPurple)),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: 'Password'),
        ),
      ),
    );
  }
}
