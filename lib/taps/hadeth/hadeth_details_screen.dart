import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';

import '../../app_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "Hadeth details screen";

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  late HadethDetailsArg arg;
  List<String> ahadethContent = [];
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as HadethDetailsArg;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(arg.hadethName)),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(left: 29, right: 29, bottom: 98),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child:
              ahadethContent.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          ahadethContent[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        );
                      },

                      itemCount: ahadethContent.length,
                    ),
                  ),
        ),
      ),
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent = await rootBundle.loadString(
      "assets/ahadeth.txt",
    );
    List<String> ahadethText = ahadethFileContent.split("#");
    ahadeth =
        ahadethText.map((ahadethText) {
          List<String> hadethLines = ahadethText.split("\n");
          String title = hadethLines.first;
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          return Hadeth(title: title, content: content);
        }).toList();
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content = [];
  Hadeth({required this.title, required this.content});
}
