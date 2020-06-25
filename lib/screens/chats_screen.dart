import 'package:flutter/material.dart';

import '../models/chat_model.dart';
import '../widgets/chat_list_item.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatDeatails.length,
      itemBuilder: (context, index) => ChatListItem(
        name: chatDeatails[index].name,
        message: chatDeatails[index].message,
        time: chatDeatails[index].time,
        avatarUrl: chatDeatails[index].avatarUrl,
      ),
    );
  }
}
