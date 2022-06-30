import 'package:cindy_radio/model/chat_model.dart';

var res = [
  {
    "id": "9991",
    "last_message": "How about tomorrow then?",
    "members": [
      "John",
      "Daniel",
      "Rachel"
    ],
    "topic": "pizza night",
    "modified_at": 1599814026153
  },
  {
    "id": "9992",
    "last_message": "I will send them to you asap",
    "members": [
      "Raphael"
    ],
    "topic": "slides",
    "modified_at": 1599000026153
  },
  {
    "id": "9993",
    "last_message": "Can you please?",
    "members": [
      "Mum",
      "Dad",
      "Bro"
    ],
    "topic": "pictures",
    "modified_at": 1512814026153
  }
];
final formatted = res.map((e) => ChatModel.fromJson(e)).toList();