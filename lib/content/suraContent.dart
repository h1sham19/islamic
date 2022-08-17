import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/Themes.dart';
import '../model/provider.dart';

class suraVerses extends StatefulWidget {
  static const routeName = "Sura Detailes";

  @override
  State<suraVerses> createState() => _suraVersesState();
}

class _suraVersesState extends State<suraVerses> {
  String suraContant = "";
  List<String> suraLine = [];

  @override
  Widget build(BuildContext context) {
    model provider = Provider.of(context);
    var args =
        ModalRoute.of(context)!.settings.arguments as suraDetailsArguments;
    Size size = MediaQuery.of(context).size;
    readFile(args.detailesOfSura);
    return Stack(
      children: [
        Image.asset(
          provider.isDark()?"assets/images/bgDark.png":"assets/images/bgLight.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: provider.isDark()?Colors.white:Colors.black),
            title: Text(
              args.suraName,
              style: provider.isDark()
                  ? themeApp.darkTheme.textTheme.headline1
                  : themeApp.lightTheme.textTheme.headline1,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: suraLine.isEmpty
              ? CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: size.height * 0.7,
                        width: size.width * 0.9,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1,
                            vertical: size.height * 0.06),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:provider.isDark()?themeApp.primaryColorDark:themeApp.fontDark,
                        ),
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 60),
                                  child: Divider(
                                    thickness: 1,
                                    color:provider.isDark()?Colors.white:themeApp.primaryColorLight,
                                  ));
                            },
                            itemBuilder: (context, index) {
                              return Text(
                                "${suraLine[index]}(${index + 1})",
                                style: provider.isDark()
                                    ? themeApp.darkTheme.textTheme.bodyText1
                                    : themeApp.lightTheme.textTheme.bodyText1,
                                textDirection: TextDirection.rtl,
                              );
                            },
                            itemCount: suraLine.length)),
                  ],
                ),
        ),
      ],
    );
  }

  void readFile(String fileName) async {
    suraContant = await rootBundle.loadString("assets/files/qoran/$fileName");
    suraLine = suraContant.split("\n");
    setState(() {});
  }
}

class suraDetailsArguments {
  String suraName;
  String detailesOfSura;

  suraDetailsArguments({required this.detailesOfSura, required this.suraName});
}
