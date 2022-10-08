import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/infraestructure/services/api/auth_service.dart';

import 'package:chat_app/config/global/environment.dart';
import 'package:chat_app/domain/models/common/messages_response.dart';
import 'package:chat_app/domain/models/user/user.dart';

import 'package:chat_app/domain/models/message/message.dart';

class ChatService extends GetxController {
  late User userTo;

  Future<List<Message>> getChat(String userIdToSearchMessages) async {
    final url =
        Uri.parse('${Environment.apiUrl}/messages/$userIdToSearchMessages');
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken()
    });

    final messagesResponse = messagesResponseFromJson(res.body);

    return messagesResponse.messages;
  }
}
