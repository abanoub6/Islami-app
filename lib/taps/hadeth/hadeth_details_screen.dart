import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';

import '../../app_theme.dart';
import '../../widgets/loading_indicator.dart';
import 'hadeth_details_arg.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "Hadeth details screen";

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  /*if we initialize it inside the build every time the build called it we
  declear a new arg
   */
  late HadethDetailsArg arg;

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
              arg.content.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        arg.content[index],
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      );
                    },

                    itemCount: arg.content.length,
                  ),
        ),
      ),
    );
  }
}
