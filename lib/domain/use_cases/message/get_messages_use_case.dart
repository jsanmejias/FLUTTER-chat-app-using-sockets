import 'package:chat_app/domain/models/message/gateway/message_gateway.dart';

import 'package:chat_app/domain/models/user/user.dart';
import 'package:chat_app/domain/models/message/message.dart';

class GetMessagesUseCase {
  final MessageGateway messageGateway;

  GetMessagesUseCase({required this.messageGateway});
  void setUserTo(User user) {
    return messageGateway.setUserTo(user);
  }

  Future<List<Message>> getChat(String userIdToSearchMessages) {
    return messageGateway.getChat(userIdToSearchMessages);
  }

  User getUserTo() {
    return messageGateway.getUserTo();
  }
}
