import 'package:flutter/material.dart';
import 'package:islami/home/Hadeth/Hadeth.dart';
import 'package:provider/provider.dart';

import '../MyThemeData.dart';
import '../providers/SettingsProvider.dart';

class HadethDetails extends StatelessWidget {
  static const routeName = 'hadeth';

  @override
  Widget build(BuildContext context) {
    var args =  ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<SettingsProvider>(context);
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
                    child:Text(args.content,style: TextStyle(
                      fontSize: 20,fontFamily: 'Quran'
                    ),textAlign: TextAlign.center,textDirection: TextDirection.rtl,)

                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
