import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/view/pages/chat/chat_controller.dart';

import 'package:chat_app/view/pages/chat/widgets/chat_page_app_bar.dart';
import 'package:chat_app/view/pages/chat/widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  ChatController chatController = Get.find();

  @override
  void initState() {
    chatController.setInitials(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: ChatPageAppBar(),
          body: Column(
            children: [
              Obx(
                () => Flexible(
                  child: ListView.builder(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: chatController.bubbles.length,
                    itemBuilder: (_, index) => chatController.bubbles[index],
                  ),
                ),
              ),
              const Divider(height: 1),
              Container(
                color: Colors.white,
                child: ChatInput(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    chatController.onDispose();
    super.dispose();
  }
}
