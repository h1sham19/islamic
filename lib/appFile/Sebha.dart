import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class sebha extends StatefulWidget {
  const sebha({Key? key}) : super(key: key);

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
                      child: Image.asset(
                        "assets/images/head of seb7a.png",
                        fit: BoxFit.fill,
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
                          child: Image.asset("assets/images/body of seb7a.png"),
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
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$number",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 220,
                height: 65,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text("${azkar[currentIndex]}",
                    style: Theme.of(context).textTheme.headline4),
              ),
            ],
          ),
        )
      ],
    );
  }

  onPressed() {
    number++;
    if (number == 34) {
      currentIndex++;
      number = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    angle--;
    setState(() {});
  }
}
