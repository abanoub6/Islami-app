import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran.dart';
import 'package:flutter/services.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];
  late SuraDetailsArg arg;

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArg;
    loadSuraText();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(arg.suraName)),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(left: 29, right: 29, bottom: 98),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),

          child:
              ayat.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        ayat[index],
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      );
                    },
                    itemCount: ayat.length,
                  ),
        ),
      ),
    );
  }

  Future<void> loadSuraText() async {
    String suraText = await rootBundle.loadString(
      "assets/quranText/${arg.index + 1}.txt",
    );
    ayat = suraText.split("\r\n");
    setState(() {});
  }
}
