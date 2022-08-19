import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/model/Themes.dart';
import 'package:islamic/model/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class sebha extends StatefulWidget {
  @override
  State<sebha> createState() => _sebhaState();
}
class _sebhaState extends State<sebha> {
  int number = 0;
  int currentIndex = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله أكبر",
    "لا حول ولا قوة الا بالله",
  ];
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    model provider =Provider.of(context);
    getSebha();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.46,
                      child: provider.isDark()?Image.asset(
                        "assets/images/head of seb7a dark.png",
                      ):Image.asset(
                        "assets/images/head of seb7a.png",
                      ),
                      ),
                    Positioned(
                      top: 40,
                      left: MediaQuery.of(context).size.width * 0.15,
                      right: MediaQuery.of(context).size.width * 0.15,
                      child: GestureDetector(
                        onTap: onPressed,
                        child: Transform.rotate(
                          angle: angle,
                          child: provider.isDark()?Image.asset(
                            "assets/images/body of seb7a dark.png",
                          ):Image.asset(
                            "assets/images/body of seb7a.png",),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.numberOfCalls,
                    style:themeApp.lightTheme.textTheme.headline2,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color:provider.isDark()?Colors.black45:themeApp.primaryColorLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$number",
                  style: provider.isDark()?themeApp.darkTheme.textTheme.headline2:themeApp.lightTheme.textTheme.headline2,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 220,
                height: 65,
                decoration: BoxDecoration(
                  color: provider.isDark()?themeApp.colorDark:themeApp.primaryColorLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text("${azkar[currentIndex]}",
                    style: themeApp.lightTheme.textTheme.headline3),
              ),
            ],
          ),
        )
      ],
    );
  }

  onPressed() async {
    final pref=await SharedPreferences.getInstance();
    number++;
    if (number == 34) {
      currentIndex++;
      number = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    angle--;
    pref.setInt("number", number);
    pref.setString("azkar", azkar[currentIndex]);
    pref.setDouble("angle", angle);
    setState(() {});
  }
  void getSebha() async{
    final pref=await SharedPreferences.getInstance();
    pref.getInt("number");
    pref.getString("azkar");
    pref.getDouble("angle");
  }
}
