import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_places/pages/place_form_page.dart';
import 'package:great_places/pages/places_list_page.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/theme/palette.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Palette.customLightGreenColor,
          ).copyWith(
            secondary: Palette.customLightGreenColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Palette.customLightColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Palette.customDarkBlueColor,
            selectionColor: Palette.customLightGreenColor,
            selectionHandleColor: Palette.customLightGreenColor,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Palette.customDarkBlueColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Palette.customDarkBlueColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Palette.customDarkBlueColor,
              ),
            ),
            labelStyle: TextStyle(
              color: Palette.customDarkBlueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(color: Palette.customDarkBlueColor),
            headline2: TextStyle(color: Palette.customDarkBlueColor),
            bodyText1: TextStyle(color: Palette.customDarkBlueColor),
            bodyText2: TextStyle(color: Palette.customDarkBlueColor),
            subtitle1: TextStyle(color: Palette.customDarkBlueColor),
            subtitle2: TextStyle(color: Palette.customDarkBlueColor),
            button: TextStyle(color: Palette.customDarkBlueColor),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Palette.customDarkBlueColor,
            titleTextStyle: TextStyle(
              color: Palette.customGrayColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: IconThemeData(
              color: Palette.customGrayColor,
            ),
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Palette.customLightGreenColor, // background
              onPrimary: Palette.customDarkBlueColor, // foreground
            ),
          ),
        ),
        home: const PlacesListPage(),
        routes: {
          AppRoutes.placeFormRoute: (context) => const PlaceFormPage(),
        },
      ),
    );
  }
}
