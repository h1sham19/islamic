import 'package:flutter/material.dart';
import 'package:islamic/model/ahadethcontent.dart';

class hadethDetailes extends StatefulWidget {
  static const routeName = "hadeth Detailes";

  @override
  State<hadethDetailes> createState() => _suraVersesState();
}

class _suraVersesState extends State<hadethDetailes> {
  @override
  Widget build(BuildContext context) {
    hadeth args = ModalRoute.of(context)!.settings.arguments as hadeth;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/bgLight.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.headline1,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: args.content.isEmpty
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
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                "${args.content[index]}",
                                style: Theme.of(context).textTheme.bodyText1,
                              );
                            },
                            itemCount: args.content.length)),
                  ],
                ),
        ),
      ],
    );
  }
}
