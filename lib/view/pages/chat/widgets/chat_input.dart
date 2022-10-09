import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/chat/chat_controller.dart';

import 'package:chat_app/view/common/style/colors.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: chatController.textEditingController,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: chatController.handleSubmit(),
                onChanged: (String text) {
                  if (text.trim().isNotEmpty) {
                    chatController.isWritting.value = true;
                  } else {
                    chatController.isWritting.value = false;
                  }
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send Message'),
                focusNode: chatController.focusNode,
              ),
            ),
            if (Platform.isIOS)
              Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: CupertinoButton(
                    onPressed: chatController.isWritting.value
                        ? (() => chatController.handleSubmit())
                        : null,
                    child: const Text('Send'),
                  ),
                ),
              )
            else
              Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      onPressed: chatController.isWritting.value
                          ? (() => chatController.handleSubmit())
                          : null,
                      color: electricPurple,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.trending_neutral_outlined,
                        size: Get.height * 0.05,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
