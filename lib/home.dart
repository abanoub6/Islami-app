import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/settings.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';
import 'package:islami_app/taps/quran/quran.dart';
import 'package:islami_app/taps/radio/radio_tap.dart';
import 'package:islami_app/taps/sepha/sepha.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;
  List<Widget> taps = [RadioTap(), Sepha(), Hadeth(), Quran(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/default_bg.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("إسلامي")),
        body: taps[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {});
            currentIndex = index;
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
              label: "radio",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              label: "sebha",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: "hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
              label: "quran",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "settings",
            ),
          ],
        ),
      ),
    );
  }
}
