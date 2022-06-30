



import 'package:cindy_radio/model/chat_model.dart';
import 'package:cindy_radio/widget/chat_list.dart';

class ChatResponseData{
  static List<ChatModel> chatList = [];
  final chats = List.from(res).map((e) => ChatModel.fromJson(e)).toList();
  final formatted = res.map((e) => ChatModel.fromJson(e)).toList();
  
}