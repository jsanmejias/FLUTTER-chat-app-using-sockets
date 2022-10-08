import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/colors.dart';

class CustomButtom extends StatelessWidget {
  final Color? backgroundColor;
  final String placeHolder;
  final dynamic Function()? onPressed;

  const CustomButtom(
      {super.key, required this.placeHolder, required this.onPressed, this.backgroundColor = darkPurple});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 5,
          disabledBackgroundColor: Colors.grey,
          backgroundColor: backgroundColor,
          shape: const StadiumBorder()),
      child: Center(
        child: Text(
          placeHolder,
          style: TextStyle(color: Colors.white, fontSize: Get.height * 0.022),
        ),
      ),
    );
  }
}
