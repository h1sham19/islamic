import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/appFile/AhadethDetails.dart';
import 'package:islamic/appFile/suraVerses.dart';

import 'appFile/app.dart';

void main() {
  runApp(MaterialApp(
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
      theme: ThemeData(
          primaryColorLight: Color.fromRGBO(183, 147, 95, 1),
          primaryColorDark: Color.fromRGBO(250, 204, 29, 1.0),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline3: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black),
              bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              headline4: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ))),
      routes: {
        "homeApp": (context) => app(),
        suraVerses.routeName: (context) => suraVerses(),
        AhdethDetails.routeName: (context) => AhdethDetails(),
      },
      initialRoute: "homeApp",
      home: app()));
}
