import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:chat/pages/loading_page.dart';
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
            // textSelectionTheme: const TextSelectionThemeData(
            //   cursorColor: Colors.amber,
            //   selectionColor: Colors.amber,
            //   selectionHandleColor: Colors.amber,
            // ),
            // inputDecorationTheme: const InputDecorationTheme(
            //   focusedBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(
            //       color: Colors.amber,
            //     ),
            //   ),
            //   enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(
            //       color: Colors.amber,
            //     ),
            //   ),
            //   border: UnderlineInputBorder(
            //     borderSide: BorderSide(
            //       color: Colors.amber,
            //     ),
            //   ),
            //   labelStyle: TextStyle(
            //     color: Colors.amber,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            textTheme: const TextTheme(
              headline1: TextStyle(color: Palette.customDarkBlueColor),
              bodyText1: TextStyle(color: Palette.customDarkBlueColor),
              button: TextStyle(color: Palette.customDarkBlueColor),
            ),
            // appBarTheme: const AppBarTheme(
            //   backgroundColor: Colors.amber,
            //   titleTextStyle: TextStyle(
            //     color: Colors.amber,
            //     fontSize: 18,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   iconTheme: IconThemeData(
            //     color: Colors.amber,
            //   ),
            //   centerTitle: true,
            // ),
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.amber, // background
            //     onPrimary: Colors.amber, // foreground
            //     onSurface: Colors.amber,
            //   ),
            // ),
          ),
          home: AuthOrAppPage(),
        ),
      ),
    );
  }
}
