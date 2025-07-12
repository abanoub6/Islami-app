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
      child: Scaffold(backgroundColor: Colors.transparent),
    );
  }
}
