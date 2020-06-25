import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './screens/splash_screen.dart';
import './widgets/whats_app_home.dart';
import './screens/settings_chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
          primaryColor: const Color(0xFF075E54),
          accentColor: const Color(0xFF25D366),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
          ),
          brightness: brightness == Brightness.light
              ? Brightness.light
              : Brightness.dark,
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? Colors.blueGrey[900]
              : Colors.white,
        );
      },
      themedWidgetBuilder: (BuildContext context, ThemeData themeData) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          title: 'WhatsApp Clone',
          home: SplashScreen(),
          routes: {
            WhatsAppHome.routeName: (ctx) => WhatsAppHome(),
            SettingsChatScreen.routeName: (ctx) => SettingsChatScreen(),
          },
        );
      },
    );
  }
}
