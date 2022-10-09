import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/chat/chat_controller.dart';

import 'package:chat_app/view/common/style/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String uid;
  final AnimationController animationController;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.uid,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (chatController) => FadeTransition(
        opacity: animationController,
        child: SizeTransition(
          sizeFactor: CurvedAnimation(
              parent: animationController, curve: Curves.easeOut),
          child: Container(
            child: uid == chatController.getLoggedUser().uid
                ? _myMessage(context)
                : _notMyMessage(context),
          ),
        ),
      ),
    );
  }

  Widget _myMessage(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: Get.width * 0.025, bottom: Get.height * 0.007),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: electricPurple,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.height * 0.002),
            child: Text(
              message,
              style: TextStyle(
                  fontSize: Get.height * 0.020,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _notMyMessage(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Get.width * 0.025, bottom: Get.height * 0.007),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: othersBubble,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.height * 0.002),
            child: Text(
              message,
              style: TextStyle(
                fontSize: Get.height * 0.020,
                fontWeight: FontWeight.w500,
                color: letterColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
