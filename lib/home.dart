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
  int currentIndex = 3;
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

/*
navigation bar type (shifting,fixed)
shifting : when clicked the button be focused and has a shifting space on his left and right ,
the nav bar by default be "fixed",but if the items (buttons) are more than 3 the nav bar be "shifting"
and the default color of shifting is <white >
fixed:  when clicked the button has a fixed space like the other buttons , the nav bar by default be "fixed"

and we can change the type manually ,we can change the colour using :selectedItemColour, unselectedItemColor

*
*
*
*
*
* */
