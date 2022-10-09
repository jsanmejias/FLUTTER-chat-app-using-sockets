import 'dart:convert';

import 'package:chat_app/view/helpers/string_mod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/domain/use_cases/message/get_messages_use_case.dart';
import 'package:chat_app/domain/common/use_cases/socket_connection_use_case.dart';
import 'package:chat_app/domain/use_cases/login_response/user_authentication_use_case.dart';
import 'package:chat_app/domain/models/user/user.dart';
import 'package:chat_app/domain/models/message/message.dart';

import 'package:chat_app/infraestructure/driven_adapter/login_response_api/login_response_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/message/message_service_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/common/socket_connection.dart';

import 'package:chat_app/view/pages/chat/widgets/chat_bubble.dart';

class ChatController extends GetxController {
  final SocketConnectionUseCase _socketConnectionUseCase =
      SocketConnectionUseCase(socketConnectionGateWay: SocketConnection());

  final GetMessagesUseCase _getMessagesUseCase =
      GetMessagesUseCase(messageGateway: MessageServiceApi());

  final UserAuthenticationUseCase _userAuthenticationUseCase =
      UserAuthenticationUseCase(loginResponseGateway: LoginResponseApi());

  late User userTo;
  late TickerProvider vsync;
  final focusNode = FocusNode();
  RxList<ChatBubble> bubbles = <ChatBubble>[].obs;
  RxBool isWritting = false.obs;
  TextEditingController textEditingController = TextEditingController();

  listenToMessage() {
    _socketConnectionUseCase
        .getSocket()
        .on('personal-message', _listenToMessage);
  }

  void _listenToMessage(dynamic payload) {
    ChatBubble newChatBubble = ChatBubble(
      message: payload['message'],
      uid: payload['from'],
      animationController: AnimationController(
          vsync: vsync, duration: const Duration(milliseconds: 300)),
    );

    bubbles.insert(0, newChatBubble);
    update();
    newChatBubble.animationController.forward();
  }

  handleSubmit() {
    if (textEditingController.text.isEmpty) return;

    ChatBubble newMessage = ChatBubble(
      message: textEditingController.text,
      uid: _userAuthenticationUseCase.getLoggedUser().uid,
      animationController: AnimationController(
          vsync: vsync, duration: const Duration(milliseconds: 400)),
    );

    bubbles.insert(0, newMessage);

    newMessage.animationController.forward();

    isWritting.value = false;

    _socketConnectionUseCase.getEmit()('personal-message', {
      'from': _userAuthenticationUseCase.getLoggedUser().uid,
      'to': _getMessagesUseCase.getUserTo().uid,
      'message': textEditingController.text
    });

    textEditingController.clear();
    focusNode.requestFocus();
  }

  Future<void> loadChatHistory() async {
    List<Message> chatHistory = await _getMessagesUseCase.getChat(userTo.uid);

    final List<ChatBubble> history = chatHistory
        .map((message) => ChatBubble(
              message: message.message,
              uid: message.from,
              animationController: AnimationController(
                  vsync: vsync, duration: const Duration(milliseconds: 0))
                ..forward(),
            ))
        .toList();

    bubbles.value = List.from(history);
  }

  User getLoggedUser() {
    return _userAuthenticationUseCase.getLoggedUser();
  }

  String convertStringToFormat(String message) {
    List<String> words = message.split(" ");
    words[0] = words[0].toTitleCase();
    return words.join(' ');
  }

  void onDispose() {
    for (ChatBubble bubble in bubbles) {
      bubble.animationController.dispose();
    }

    _socketConnectionUseCase.getSocket().off('personal-message');
  }

  void setInitials(TickerProvider stateVsync) async {
    userTo = _getMessagesUseCase.getUserTo();
    vsync = stateVsync;
    // await loadChatHistory();
    listenToMessage();
  }
}
