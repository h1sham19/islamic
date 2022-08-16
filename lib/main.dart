import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/content/hadethContent.dart';
import 'package:islamic/content/suraContent.dart';
import 'model/Themes.dart';
import 'app.dart';
void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        theme: themeApp.lightTheme,
        routes: {
          "homeApp": (context) => app(),
          suraVerses.routeName: (context) => suraVerses(),
          hadethDetailes.routeName: (context) => hadethDetailes()
        },
        initialRoute: "homeApp",
        home: app());
  }
}
