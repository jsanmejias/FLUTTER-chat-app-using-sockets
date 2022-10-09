import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/style.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyboardType;

  final TextCapitalization textCapitalization;

  const CustomInput(
      {super.key,
      required this.icon,
      required this.placeHolder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none});

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
      child: TextField(
        textCapitalization: textCapitalization,
        style: TextStyle(fontSize: Get.height * 0.022, color: letterColor),
        controller: textController,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: Get.height * 0.035,
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeHolder),
      ),
    );
  }
}
