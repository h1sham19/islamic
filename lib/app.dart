import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Tabs/Ahadeth.dart';
import 'Tabs/QoranPage.dart';
import 'Tabs/Radio.dart';
import 'Tabs/Sebha.dart';
import 'Tabs/Setting.dart';
import 'model/Themes.dart';
class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  int SelectedIcon = 4;
  List<Widget> Pages = [QoranPage(), ahadeth(), sebha(), radio(), Setting()];
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bgLight.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islamic,),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SelectedIcon,
            onTap: (index) {
              setState(() {
                SelectedIcon = index;
              });
            },
            iconSize: 30,
            selectedLabelStyle: TextStyle(fontSize: 15),
            items: [
              BottomNavigationBarItem(
                  backgroundColor: themeApp.primaryColorLight,
                  icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png"),
                      size: 35),
                  label: AppLocalizations.of(context)!.qoran),
              BottomNavigationBarItem(
                  backgroundColor: themeApp.primaryColorLight,
                  icon: Icon(Icons.menu_book_outlined),
                  label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  backgroundColor: themeApp.primaryColorLight,
                  icon: ImageIcon(AssetImage("assets/images/sebha.png"),
                      size: 35),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  backgroundColor: themeApp.primaryColorLight,
                  icon: Icon(Icons.radio_outlined),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  backgroundColor: themeApp.primaryColorLight,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting),
            ],
          ),
          body: Pages.elementAt(SelectedIcon),
        ),
      ],
    );
  }
}
