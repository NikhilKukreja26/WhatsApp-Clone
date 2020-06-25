import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/settings_chat_screen.dart';
import '../widgets/settings_details_tile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: SettingUserNameListTile(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'from',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: 'FACEBOOK',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingUserNameListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.goodsmile.info/cgm/images/product/20180410/7199/51422/medium/e1ab08a197fa105566949df68472702f.jpg',
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  heightFactor: 18.0,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title: Text(
            'The Flash',
            style: TextStyle(
              letterSpacing: 0.7,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'I\'m the fastest man alive !!!',
            style: TextStyle(
              letterSpacing: 0.3,
              color: Colors.blueGrey,
              fontSize: 14.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        const SizedBox(
          height: 10.0,
        ),
        SettingsDetailsTile(
          icon: MdiIcons.keyVariant,
          titleText: 'Account',
          subTitleText: 'Privacy, security, change number',
        ),
        SettingsDetailsTile(
          icon: Icons.message,
          titleText: 'Chats',
          subTitleText: 'Themes, Wallpapers, chat history',
          onTap: () =>
              Navigator.of(context).pushNamed(SettingsChatScreen.routeName),
        ),
        SettingsDetailsTile(
          icon: Icons.notifications,
          titleText: 'Notifications',
          subTitleText: 'Message, group & call tones',
        ),
        SettingsDetailsTile(
          icon: Icons.data_usage,
          titleText: 'Data and storage usage',
          subTitleText: 'Network usage, auto-download',
        ),
        SettingsDetailsTile(
          icon: MdiIcons.helpCircleOutline,
          titleText: 'Help',
          subTitleText: 'FAQ, contact us, privacy policy',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Divider(
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SettingsDetailsTile(
          icon: Icons.group,
          titleText: 'Invite a friend',
          subTitleText: '',
        ),
      ],
    );
  }
}
