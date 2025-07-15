import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class Sepha extends StatefulWidget {
  @override
  State<Sepha> createState() => _SephaState();
}

class _SephaState extends State<Sepha> {
  int numberOfSephaClicked = 0;
  double rotateAngle = 0.0;
  int taspehRound = 0;
  List<String> taspeh = [
    "سبحان الله ",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لا حول ولا قوه الا بالله",
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.rotate(
                  angle: rotateAngle,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        rotateAngle += 10;
                      });
                    },
                    child: Image.asset("assets/images/body_sebha_logo.png"),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.25,
                  bottom: MediaQuery.of(context).size.height * 0.210,
                  child: Image.asset("assets/images/head_sebha_logo.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              "عدد التسبيحات ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 26, bottom: 22),
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              color: Color(0xffB7935F).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "$numberOfSephaClicked",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Container(
            height: 51,
            width: 137,
            decoration: BoxDecoration(
              color: Color(0xffB7935F),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (numberOfSephaClicked == 33) {
                      numberOfSephaClicked = 0;
                      if (taspehRound == 4) {
                        taspehRound = 0;
                      } else {
                        taspehRound++;
                      }
                    }

                    numberOfSephaClicked++;
                  });
                },
                child: Text(
                  "${taspeh[taspehRound]} ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
