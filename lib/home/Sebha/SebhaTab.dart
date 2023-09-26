import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyThemeData.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';
class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int index =0 ;
  List<String> praise =[
    'سبحان الله',
    'الحمد لله',
    'الله اكبر'
  ];


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    if(counter==33){
      index++;
      counter=0;
    }
    if (index>2){
      index=0;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Container(
            height: 300,
            child:
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(provider.getSebhaHeadImage(),width: 50,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              angle--;
                              counter++;
                              print(counter);
                            });
                          },
                          child: Transform.rotate(
                            angle: angle,
                            child: Container(
                            padding: EdgeInsets.all(48),
                              child: Image.asset(
                                width: 200,
                                provider.getSebhaBodyImage(),

                              ),
                            ),
                          ),
                        ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
          ),
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.number_of_praises, style: TextStyle(fontSize: 25)),
          SizedBox(
            height: 10,
          ),
          Card(

            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(counter.toString(), style: TextStyle(fontSize: 30,)),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          Card(

            margin: EdgeInsets.all(10),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
           color: Theme.of(context).dividerColor,

            child:
            Container(
                padding: EdgeInsets.all(10),
                child: Text(praise[index] ,style: TextStyle(fontSize: 30,fontFamily: 'Quran'))

            ),
          ),
        ],
      ),

    );

  }

}
