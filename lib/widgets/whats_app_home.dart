import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/settings_screen.dart';

import '../screens/camera_screen.dart';
import '../screens/chats_screen.dart';
import '../screens/status_screen.dart';
import '../screens/calls_screen.dart';
import '../models/chat_model.dart';
import '../screens/search_screen.dart';

class WhatsAppHome extends StatefulWidget {
  static const routeName = '/whatsapp-home';
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  bool showFab = true;

  List<ChatModel> chatModel = chatDeatails;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width / 5;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        title: Text('WhatsApp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(chatModel: chatModel),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('New group'),
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
              ),
              PopupMenuItem(
                child: Text('WhatsApp Web'),
              ),
              PopupMenuItem(
                child: Text('Started messages'),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    child: Text('Settings'),
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).accentColor
              : Colors.white,
          indicatorWeight: 3.0,
          isScrollable: true,
          tabs: [
            Container(
              width: 30,
              child: Tab(
                icon: Icon(Icons.camera_alt),
              ),
            ),
            Container(
              width: yourWidth,
              child: Tab(
                text: 'CHATS',
              ),
            ),
            Container(
              width: yourWidth,
              child: Tab(
                text: 'STATUS',
              ),
            ),
            Container(
              width: yourWidth,
              child: Tab(
                text: 'CALLS',
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.message,
              ),
            )
          : null,
    );
  }
}
