import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/style.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        //width: 170,
        child: Column(
          children: [
            Image(
              image: const AssetImage('assets/logo.png'),
              height: Get.height * 0.20,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  color: darkBlue,
                  fontSize: Get.height * 0.04,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
