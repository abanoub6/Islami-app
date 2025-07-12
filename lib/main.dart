import 'package:flutter/material.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/settings.dart';

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
      },
      initialRoute: Home.routeName,
    );
  }
}
