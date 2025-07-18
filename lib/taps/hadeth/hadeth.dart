import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/taps/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

import 'hadeth_data.dart';
import 'hadeth_details_arg.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethData> ahadeth = [];
  @override
  /* if i called the load fun  inside the build it will call many times and that is wrong.
   because if it inside ,the build will call the load and the set state inside the load
   will call the build and repeat to infinity loop
   */
  void initState() {
    super.initState();
    loadingHadethFile();
  }

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
                        hadethName: ahadeth[index].title,
                        index: index,
                        content: ahadeth[index].content,
                      ),
                    );
                  },
                  child:
                      ahadeth.isEmpty
                          ? LoadingIndicator()
                          : Text(
                            textAlign: TextAlign.center,
                            (ahadeth[index].title),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                ),
            itemCount: ahadeth.length,
          ),
        ),
      ],
    );
  }

  Future<void> loadingHadethFile() async {
    String ahadethFileContent = await rootBundle.loadString(
      "assets/ahadeth.txt",
    );
    List<String> hadethText = ahadethFileContent.split("#");
    //parsing
    ahadeth =
        hadethText.map((hadethText) {
          List<String> hadethLines = hadethText.trim().split("\n");
          String title = hadethLines.first;
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          return HadethData(title: title, content: content);
        }).toList();
    setState(() {});
  }
}
