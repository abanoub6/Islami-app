import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran.dart';
import 'package:flutter/services.dart';

import '../../widgets/loading_indicator.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];
  late SuraDetailsArg suraArg;
  @override
  void initState() {
    super.initState();
    loadSuraText();
  }

  @override
  Widget build(BuildContext context) {
    suraArg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArg;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(suraArg.suraName)),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(left: 29, right: 29, bottom: 98),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),

          child:
              ayat.isEmpty
                  ? LoadingIndicator()
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
      "assets/quranText/${suraArg.index + 1}.txt",
    );
    ayat = suraText.split("\r\n");
    setState(() {});
  }
}
