import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/appFile/AhadethDetails.dart';

class ahadeth extends StatefulWidget {
  @override
  State<ahadeth> createState() => _ahadethState();
}

class _ahadethState extends State<ahadeth> {
  List<String> ahadethName = [];
  List<String> hadethContent = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethName.isEmpty) {
      readAhadethFile();
    }
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg3.png",
              fit: BoxFit.fill,
            )),
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
                color: Theme.of(context).primaryColorLight,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ahadeth,
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColorLight,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    color: Colors.transparent,
                    child: ListView.builder(
                        itemCount: ahadethName.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AhdethDetails.routeName,
                                  arguments: hadethDetailesArg(
                                      ahadethName[index],
                                      hadethContent[index]));
                            },
                            child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  ahadethName[index],
                                  style: Theme.of(context).textTheme.headline3,
                                )),
                          );
                        })),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void readAhadethFile() async {
    String hadethFile =
        await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadethh = hadethFile.split("#\r\n");
    for (int i = 0; i < ahadethh.length; i++) {
      String hadethLines = ahadethh[i];
      hadethContent = hadethLines.split("\n");
      ahadethName.add(hadethContent[0]);
      hadethContent.removeAt(0);
    }
    setState(() {});
  }
}

class hadethDetailesArg {
  String hadethName;
  String detailesHadeth;

  hadethDetailesArg(this.hadethName, this.detailesHadeth);
}
