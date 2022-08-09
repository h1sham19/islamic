import 'package:flutter/material.dart';

import 'Ahadeth.dart';

class AhdethDetails extends StatefulWidget {
  static const routeName = "Ahadeth Details";

  @override
  State<AhdethDetails> createState() => _AhdethDetailsState();
}

class _AhdethDetailsState extends State<AhdethDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)!.settings.arguments as hadethDetailesArg;
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg3.png",
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              args.hadethName,
              style: Theme.of(context).textTheme.headline1,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: size.height * 0.7,
                  width: size.width * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.06),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          "${args.detailesHadeth[index]}",
                          style: Theme.of(context).textTheme.bodyText1,
                        );
                      },
                      itemCount: args.hadethName.length)),
            ],
          ),
        ),
      ],
    );
  }
}
