import 'package:flutter/material.dart';
import 'package:islami_app/taps/hadeth/hadeth_details_screen.dart';

class Hadeth extends StatelessWidget {
  List<String> hadethNames = ["1", "2", "3"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Text("الاحاديث ", style: Theme.of(context).textTheme.headlineSmall),
        Container(
          height: 2,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 18),
            itemBuilder:
                (_, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HadethDetailsScreen.routeName,
                      arguments: HadethDetailsArg(
                        hadethName: hadethNames[index],
                        index: index,
                      ),
                    );
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    hadethNames[index],
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
            itemCount: hadethNames.length,
          ),
        ),
      ],
    );
  }
}

class HadethDetailsArg {
  String hadethName;
  int index;
  HadethDetailsArg({required this.hadethName, required this.index});
}
