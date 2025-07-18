import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/settings.dart';
import 'package:islami_app/taps/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/taps/quran/sura_details.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        Home.routeName: (_) => Home(),
        Settings.routeName: (_) => Settings(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: Home.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
