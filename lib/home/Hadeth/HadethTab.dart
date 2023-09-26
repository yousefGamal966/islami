import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/Hadeth/Hadeth.dart';
import 'package:islami/home/Hadeth/HadethTitleWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if(allHadeth.isEmpty){
      loadHadethFile();
    }

    return Column(
      children: [
        Expanded(
            flex:1,
            child: Image.asset('assets/images/hadeth_head.png')),
        Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Theme.of(context).dividerColor, width: 3))),
            child: Text(
              AppLocalizations.of(context)!.hadeth_number,
              style: TextStyle(fontSize: 23),
            )),
        Expanded(
          flex: 3,
          child:
          allHadeth.isEmpty?
              Center(child:CircularProgressIndicator() ,):
          ListView.separated(
              itemBuilder: (context, index) {
                return HadethTitleWidget(allHadeth[index]);
              },
              separatorBuilder: (context, index) => Container(
                    color: Theme.of(context).dividerColor,
                    width: double.infinity,
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 64),
                  ),
              itemCount: allHadeth.length),
        )
      ],
    );
  }

  List<Hadeth> allHadeth = [];

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = fileContent.trim().split('#');
    for (int i = 0; i < hadethList.length; i++) {
      String singleHadeth = hadethList[i];
      List<String> hadethLines = singleHadeth.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.remove(0);
      String content = hadethLines.join('\n');
      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {

    });
  }
}
