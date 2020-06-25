import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import '../widgets/chat_list_item.dart';
import '../models/chat_model.dart';

class SearchScreen extends SearchDelegate {
  final List<ChatModel> chatModel;

  SearchScreen({
    this.chatModel,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Theme.of(context).primaryColor,
      brightness: DynamicTheme.of(context).brightness,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchedPerson = query.isEmpty
        ? chatModel
        : chatModel
            .where((chatModel) =>
                chatModel.name.toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: searchedPerson.length,
      itemBuilder: (context, index) => ChatListItem(
        name: searchedPerson[index].name,
        message: searchedPerson[index].message,
        time: searchedPerson[index].time,
        avatarUrl: searchedPerson[index].avatarUrl,
      ),
    );
  }
}
