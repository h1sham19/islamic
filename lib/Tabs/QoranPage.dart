import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/content/suraContent.dart';
import 'package:islamic/model/Themes.dart';
import 'package:islamic/model/provider.dart';
import 'package:provider/provider.dart';

class QoranPage extends StatefulWidget {
  @override
  State<QoranPage> createState() => _QoranPageState();
}

class _QoranPageState extends State<QoranPage> {
  int number = 0;
  List<String> suraTilte = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    model provider=Provider.of(context);
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/ahadethImage.png"),
              ),
              const Divider(
                thickness: 3,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.surahName,
                      style: provider.isDark()?themeApp.darkTheme.textTheme.headline2
                      :themeApp.lightTheme.textTheme.headline2,
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    color: Colors.transparent,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: const Divider(
                                thickness: 1,
                              ));
                        },
                        itemCount: suraTilte.length - 1,
                        itemBuilder: (context, number) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, suraVerses.routeName,
                                  arguments: suraDetailsArguments(
                                      detailesOfSura: "${number + 1}.txt",
                                      suraName: suraTilte[number]));
                            },
                            child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  suraTilte[number],
                                  style: provider.isDark()?themeApp.darkTheme.textTheme.headline3
                                      :themeApp.lightTheme.textTheme.headline3,
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
}
