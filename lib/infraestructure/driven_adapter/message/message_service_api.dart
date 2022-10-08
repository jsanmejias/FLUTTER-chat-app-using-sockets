import 'package:get/get.dart';

import 'package:chat_app/domain/models/message/gateway/message_gateway.dart';
import 'package:chat_app/domain/models/user/user.dart';
import 'package:chat_app/domain/models/message/message.dart';

import 'package:chat_app/infraestructure/services/api/chat_service.dart';

class MessageServiceApi implements MessageGateway {
  ChatService chatService = Get.find();

  @override
  Future<List<Message>> getChat(String userIdToSearchMessages) {
    return chatService.getChat(userIdToSearchMessages);
  }

  @override
  void setUserTo(User user) {
    chatService.userTo = user;
  }

  @override
  User getUserTo() {
    return chatService.userTo;
  }
}
