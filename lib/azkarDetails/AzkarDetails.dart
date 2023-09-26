import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/azkarDetails/ZekrWidget.dart';

class AzkarDetails extends StatefulWidget {
  static const routeName = 'azkar';

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  int index = 0;


  List<int> zekr =[
    1,3,3,3,1,1,3,4,1,7,3,1,1,3,3,3,1,3,1,1,3,10,3,3,3,3,1,1,100,100,100
  ];

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as AzkarDetailsArgs;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/main_background.jpg',
              ))),
      child: Scaffold(
        body:Column(
          children: [
            ListView.separated(itemBuilder:(context, index) {
              return ZekrWidget(verses[index]);
            },  separatorBuilder:(context, index) {
              return ElevatedButton(onPressed:(){} ,child:Text(zekr.toString()) ,);

            }, itemCount: verses.length)
          ],
        )
      ),
    );



  }

  List<String>verses =[];

  void loadFile(int index) async {
    String fileContent =
    await rootBundle.loadString('assets/files/dayAzkar/z${index + 1}.txt');
    verses = fileContent as List<String>;
    setState(() {

    });

  }
}
class AzkarDetailsArgs{
  int index;
  String text;
  AzkarDetailsArgs(this.text,this.index);
}

