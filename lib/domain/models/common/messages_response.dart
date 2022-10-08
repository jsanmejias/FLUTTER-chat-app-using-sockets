// To parse this JSON data, do
//
//     final messagesResponse = messagesResponseFromJson(jsonString);

import 'package:chat_app/domain/models/message/message.dart';

import 'dart:convert';

MessagesResponse messagesResponseFromJson(String str) => MessagesResponse.fromJson(json.decode(str));

String messagesResponseToJson(MessagesResponse data) => json.encode(data.toJson());

class MessagesResponse {
    MessagesResponse({
        required this.ok,
        required this.messages,
    });

    bool ok;
    List<Message> messages;

    factory MessagesResponse.fromJson(Map<String, dynamic> json) => MessagesResponse(
        ok: json["ok"],
        messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    };
}


