import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String routeName = "Home";

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
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0XffB7935F),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          iconSize: 45,
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
