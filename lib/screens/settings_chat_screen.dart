import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/settings_details_tile.dart';
import '../widgets/custom_radio_button/custom_radio_button.dart';

class SettingsChatScreen extends StatefulWidget {
  static const routeName = 'settings-chat';

  @override
  _SettingsChatScreenState createState() => _SettingsChatScreenState();
}

class _SettingsChatScreenState extends State<SettingsChatScreen> {
  int themeRadioButton;

  setThemeRadioBtton(int value) {
    setState(() {
      themeRadioButton = value;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeRadioButton = Theme.of(context).brightness == Brightness.light ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        elevation: 0.7,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Display',
                style: TextStyle(
                  color: Color(0xFF128C7E),
                  fontSize: 15.0,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SettingsDetailsTile(
                onTap: () {
                  showThemeDialog(context);
                },
                icon: MdiIcons.brightness6,
                titleText: 'Theme',
                subTitleText: Theme.of(context).brightness == Brightness.light
                    ? 'Light'
                    : 'Dark',
              ),
              SettingsDetailsTile(
                onTap: () => print('object'),
                icon: MdiIcons.wallpaper,
                titleText: 'Wallpaper',
                subTitleText: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showThemeDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'CANCEL',
            ),
          )
        ],
        title: Text(
          'Choose Theme',
          textAlign: TextAlign.left,
        ),
        content: Container(
          width: 100.0,
          height: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RadioButton(
                description: 'Light',
                value: 0,
                groupValue: themeRadioButton,
                onChanged: (int value) {
                  setThemeRadioBtton(value);
                  print(value);
                  DynamicTheme.of(context).setBrightness(Brightness.light);
                  Navigator.of(context).pop();
                },
              ),
              RadioButton(
                description: 'Dark',
                value: 1,
                groupValue: themeRadioButton,
                onChanged: (int value) {
                  setThemeRadioBtton(value);
                  print(value);
                  DynamicTheme.of(context).setBrightness(Brightness.dark);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
