import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ChatNotificationService(),
          ),
        ],
        child: MaterialApp(
          title: 'Chat',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Palette.customLightGreenColor,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Palette.customLightGreenColor,
            ).copyWith(
              secondary: Palette.customLightGreenColor,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Palette.customLightColor,
            textTheme: const TextTheme(
              headline1: TextStyle(color: Palette.customDarkBlueColor),
              bodyText1: TextStyle(color: Palette.customDarkBlueColor),
              button: TextStyle(color: Palette.customDarkBlueColor),
            ),
          ),
          home: const AuthOrAppPage(),
        ),
      ),
    );
  }
}
