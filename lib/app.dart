import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Tabs/Ahadeth.dart';
import 'Tabs/QoranPage.dart';
import 'Tabs/Radio.dart';
import 'Tabs/Sebha.dart';
import 'Tabs/Setting.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  int SelectedIcon = 0;
  List<Widget> Pages = [QoranPage(), ahadeth(), sebha(), radio(), Setting()];

  // Obtain shared preferences.
  final prefs = SharedPreferences.getInstance();

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
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.islamic,
              style: Theme.of(context).textTheme.headline1,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SelectedIcon,
            onTap: (index) {
              setState(() {
                SelectedIcon = index;
              });
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            iconSize: 30,
            selectedLabelStyle: TextStyle(fontSize: 15),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png"),
                      size: 35),
                  label: AppLocalizations.of(context)!.qoran),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  icon: Icon(Icons.menu_book_outlined),
                  label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  icon: ImageIcon(AssetImage("assets/images/sebha.png"),
                      size: 35),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  icon: Icon(Icons.radio_outlined),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColorLight,
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
