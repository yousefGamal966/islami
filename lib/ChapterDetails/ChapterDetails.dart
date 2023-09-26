import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ChapterDetails/VerseWidget.dart';
import 'package:provider/provider.dart';

import '../MyThemeData.dart';
import '../providers/SettingsProvider.dart';

class ChapterDetails extends StatefulWidget {
  static const String routeName = 'ch';

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  @override
  Widget build(BuildContext context) {
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    var provider = Provider.of<SettingsProvider>(context);
    if(verses.isEmpty){
      loadFile(args.index);
    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                provider.getBackgroundImage()


              ))),
      child: Scaffold(
        appBar: AppBar(

          title: Text(
            args.title,
            style: TextStyle(
                fontSize: 30, fontFamily: 'Quran', fontWeight: FontWeight.w600),
          ),
        ),
        body:
        Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Card(

                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:verses.isEmpty?Center(
                    child: CircularProgressIndicator(),

                  ):
                      ListView.builder(itemBuilder:(context, index) {
                        return VerseWidget(verses[index], index);
                      },itemCount: verses.length,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String>verses =[];

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    verses = fileContent.split("\n");
    print(fileContent);
    setState(() {

    });


  }
}

class ChapterDetailsArgs {
  String title;
  int index;
  ChapterDetailsArgs(this.title, this.index);
}
