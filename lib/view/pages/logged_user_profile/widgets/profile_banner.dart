import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/common/style/colors.dart';

class ProfileBanner extends StatelessWidget {
  ProfileBanner({Key? key}) : super(key: key);
  final textScale = Get.textScaleFactor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: electricPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 25,
            right: 300,
            child: IconButton(
              onPressed: () => Get.back(),
              icon:
                  const Icon(Icons.arrow_back_ios_new_rounded, color: palidBack),
            ),
          ),
          Positioned.fill(
            bottom: -30,
            // right: 125,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/avatar.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
