import 'package:chat_app/domain/models/message/message.dart';
import 'package:chat_app/domain/models/user/user.dart';

abstract class MessageGateway {
  void setUserTo(User user);
  Future <List<Message>> getChat(String userIdToSearchMessages);
  User getUserTo();
}