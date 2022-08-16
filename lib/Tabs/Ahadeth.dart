import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/content/hadethContent.dart';
import '../model/ahadethcontent.dart';
import 'package:islamic/model/Themes.dart';
class ahadeth extends StatefulWidget {
  @override
  State<ahadeth> createState() => _ahadethState();
}

class _ahadethState extends State<ahadeth> {
  List<hadeth> hadethcontent = [];

  @override
  Widget build(BuildContext context) {
    if (hadethcontent.isEmpty) {
      readAhadethFile();
    }
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/ahadeth.png"),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ahadeth,
                      style: themeApp.lightTheme.textTheme.headline2,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    color: Colors.transparent,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                thickness: 1,
                              ));
                        },
                        itemCount: hadethcontent.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, hadethDetailes.routeName,
                                  arguments: hadethcontent[index]);
                            },
                            child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  hadethcontent[index].title,
                                  style: themeApp.lightTheme.textTheme.headline3,
                                )),
                          );
                        })),
              ),
            ],
          ),
        )
      ],
    );
  }

  void readAhadethFile() async {
    String hadethFile =
        await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadethh = hadethFile.split("#\r\n");
    for (int i = 0; i < ahadethh.length; i++) {
      String hadethContent = ahadethh[i];
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      hadeth Hadeth = new hadeth(title, hadethLines);
      hadethcontent.add(Hadeth);
    }
    setState(() {});
  }
}

