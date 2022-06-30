import 'dart:convert';
import 'dart:io';
import 'package:cindy_radio/model/chat_model.dart';
import 'package:cindy_radio/model/chat_response.dart';
import 'package:http/http.dart' as Client;
import 'dart:async';

class ChatAPI {
  Future<List<ChatModel>> fetchChat() async {
    final url =
        "https://idtm-media.s3.amazonaws.com/programming-test/api/inbox.json";

    print(url);

    try {
      final httpResponse = await Client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      //  print(json.decode(httpResponse.statusCode.toString()));

      if (httpResponse.statusCode == 200) {
        var respBody = httpResponse.body;
        var formatted = respBody.substring(0, respBody.length - 3);
        formatted = formatted + "]";
        print(formatted);
        var resBody = jsonDecode(formatted.toString());
        //create static variable
        ChatResponseData.chatList =
            (resBody as List).map((e) => new ChatModel.fromJson(e)).toList();
        print('hh' + ChatResponseData.chatList.toString());

        //final chats = List.from(res).map((e) => ChatModel.fromJson(e)).toList();

      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return ChatResponseData.chatList;
  }
}
