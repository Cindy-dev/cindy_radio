import 'package:cindy_radio/model/chat_model.dart';
import 'package:cindy_radio/model/chat_response.dart';
import 'package:cindy_radio/service/chat_api.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void initState() {
    super.initState();
    ChatAPI().fetchChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ChatModel>>(
        future: ChatAPI().fetchChat(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.hasData) {
            return ListView.builder(itemBuilder: (ctx, i) {
              return Container(
                child: Text(
                 ChatResponseData.chatList[i].lastMessage.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              );
            },
          itemCount: ChatResponseData.chatList.length,
            );
          } else {
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,));
          }
        },
      ),
    );
  }
}
