// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(List <Map<String, dynamic>> str) => List<ChatModel>.from(str.map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
    ChatModel({
        this.id,
        this.lastMessage,
        this.members,
        this.topic,
        this.modifiedAt,
    });

    String id;
    String lastMessage;
    List<String> members;
    String topic;
    int modifiedAt;

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        lastMessage: json["last_message"],
        members: List<String>.from(json["members"].map((x) => x)),
        topic: json["topic"],
        modifiedAt: json["modified_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "last_message": lastMessage,
        "members": List<dynamic>.from(members.map((x) => x)),
        "topic": topic,
        "modified_at": modifiedAt,
    };
}
