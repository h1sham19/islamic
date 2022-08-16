import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/model/Themes.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String currentLang = AppLocalizations.of(context)!.arabic;
    String Selected=AppLocalizations.of(context)!.arabic;
    bool DarkMood = false;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(AppLocalizations.of(context)!.lang,
                        style: themeApp.lightTheme.textTheme.headline3),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: themeApp.primaryColorLight),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Selected =
                                          AppLocalizations.of(context)!.english;
                                      currentLang = Selected;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.english,
                                          style: themeApp.lightTheme.textTheme.bodyText1?.copyWith(color:
                                          Selected==AppLocalizations.of(context)!.english?Colors.blue:Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Selected =
                                          AppLocalizations.of(context)!.arabic;
                                      currentLang = Selected;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.arabic,
                                          style: themeApp.lightTheme.textTheme.bodyText1?.copyWith(color:
                                          Selected==AppLocalizations.of(context)!.arabic?Colors.blue:Colors.black
                                          ),
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
                        currentLang,
                        style: themeApp.lightTheme.textTheme.headline3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.darkMood,
                        style: themeApp.lightTheme.textTheme.headline3),
                    Switch(
                        activeColor: themeApp.primaryColorLight,
                        activeTrackColor: Colors.black87,
                        value: DarkMood,
                        onChanged: (on) {
                          setState(() {});
                          DarkMood = on;
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
