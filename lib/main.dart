import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/content/hadethContent.dart';
import 'package:islamic/content/suraContent.dart';
import 'package:islamic/model/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'model/Themes.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => model(), child: myApp()));
}

class myApp extends StatelessWidget {
  late model prov;
  Widget build(BuildContext context) {
    prov=Provider.of(context);
    getSharedValues();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(prov.currentLang),
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
        darkTheme: themeApp.darkTheme,
        themeMode: prov.currentTheme,
        routes: {
          "homeApp": (context) => app(),
          suraVerses.routeName: (context) => suraVerses(),
          hadethDetailes.routeName: (context) => hadethDetailes()
        },
        initialRoute: "homeApp",
        home: app());
  }
  void getSharedValues () async{
    final pref=await SharedPreferences.getInstance();
    prov.changLang(pref.getString("Lang")??'ar');
    ///set Language

    if(pref.getString("Theme")=="Light"){
      prov.changTheme(ThemeMode.light);
    } if(pref.getString("Theme")=="Dark"){
      prov.changTheme(ThemeMode.dark);
    }
    ///set Theme
  }

}


