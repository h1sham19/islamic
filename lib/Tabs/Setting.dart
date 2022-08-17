import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/model/Themes.dart';
import 'package:provider/provider.dart';

import '../model/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late String Selected;
  bool darkMood = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    model provider = Provider.of(context);
    String Selected=provider.currentLang=="ar"?AppLocalizations.of(context)!.arabic
        :AppLocalizations.of(context)!.english;
    String selected=provider.currentTheme==ThemeMode.light?AppLocalizations.of(context)!.light
        :AppLocalizations.of(context)!.dark;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.lang,
                      style: provider.isDark()
                          ? themeApp.darkTheme.textTheme.headline3
                          : themeApp.lightTheme.textTheme.headline3),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color:  provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight),
                    color: provider.isDark()
                        ? themeApp.primaryColorDark
                        : themeApp.fontDark),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 1,
                            child: Container(
                              color: provider.isDark()
                                  ? themeApp.primaryColorDark
                                  : themeApp.fontDark,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Selected =
                                          AppLocalizations.of(context)!.english;
                                      provider.changLang("en");
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.english,
                                          style: provider.isDark()
                                              ? themeApp
                                                  .darkTheme.textTheme.bodyText1?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .english
                                                  ?  provider.isDark()?themeApp.colorDark:themeApp.fontDark
                                                  : Colors.white)
                                              : themeApp.lightTheme.textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      color: Selected ==
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .english
                                                          ?  provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight
                                                          : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Selected =
                                          AppLocalizations.of(context)!.arabic;
                                      provider.changLang("ar");
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.arabic,
                                          style: provider.isDark()
                                              ? themeApp
                                                  .darkTheme.textTheme.bodyText1?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .arabic
                                                  ?  provider.isDark()?themeApp.colorDark:themeApp.fontDark
                                                  : Colors.white)
                                              : themeApp.lightTheme.textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      color: Selected ==
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .arabic
                                                          ? provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight
                                                          : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (provider.currentLang=="ar"?AppLocalizations.of(context)!.arabic
                            :AppLocalizations.of(context)!.english),
                        style: provider.isDark()
                            ? themeApp.darkTheme.textTheme.headline3?.copyWith(color: themeApp.colorDark)
                            : themeApp.lightTheme.textTheme.headline3?.copyWith(color: themeApp.primaryColorLight),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.theme,
                      style: provider.isDark()
                          ? themeApp.darkTheme.textTheme.headline3
                          : themeApp.lightTheme.textTheme.headline3),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color:  provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight),
                    color: provider.isDark()
                        ? themeApp.primaryColorDark
                        : themeApp.fontDark),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 1,
                            child: Container(
                              color: provider.isDark()
                                  ? themeApp.primaryColorDark
                                  : themeApp.fontDark,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      selected =
                                          AppLocalizations.of(context)!.light;
                                      provider.changTheme(ThemeMode.light);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.light,
                                          style: provider.isDark()
                                              ? themeApp
                                              .darkTheme.textTheme.bodyText1?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .english
                                                  ?  provider.isDark()?themeApp.colorDark:themeApp.fontDark
                                                  : Colors.white)
                                              : themeApp.lightTheme.textTheme
                                              .bodyText1
                                              ?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .english
                                                  ?  provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Selected =
                                          AppLocalizations.of(context)!.dark;
                                      provider.changTheme(ThemeMode.dark);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.dark,
                                          style: provider.isDark()
                                              ? themeApp
                                              .darkTheme.textTheme.bodyText1?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .arabic
                                                  ?  provider.isDark()?themeApp.colorDark:themeApp.fontDark
                                                  : Colors.white)
                                              : themeApp.lightTheme.textTheme
                                              .bodyText1
                                              ?.copyWith(
                                              color: Selected ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .arabic
                                                  ? provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (provider.currentTheme==ThemeMode.light?AppLocalizations.of(context)!.light
                            :AppLocalizations.of(context)!.dark),
                        style: provider.isDark()
                            ? themeApp.darkTheme.textTheme.headline3?.copyWith(color: themeApp.colorDark)
                            : themeApp.lightTheme.textTheme.headline3?.copyWith(color: themeApp.primaryColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}