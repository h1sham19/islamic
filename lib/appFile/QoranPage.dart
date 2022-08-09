import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/appFile/suraVerses.dart';

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
                child: Image.asset("assets/images/Screenshot (1).png"),
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
                      AppLocalizations.of(context)!.surahName,
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
                height: MediaQuery.of(context).size.height * 0.41,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    color: Colors.transparent,
                    child: ListView.builder(
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
                                height: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  suraTilte[number],
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
}
