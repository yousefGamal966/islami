import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RadioTab extends StatelessWidget {


@override
Widget build(BuildContext context) {
return Column(
  children: [
    SizedBox(height: 30,),
    Container(
        width: 400,
        child: Image.asset('assets/images/radio_head.png')),
    SizedBox(height: 60,),
    Text(AppLocalizations.of(context)!.quran_radio,style: TextStyle(
      fontSize: 30,fontWeight: FontWeight.w500
    ),),
    SizedBox(height: 70,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/back.png'),
        Image.asset('assets/images/play.png'),
        Image.asset('assets/images/next.png'),
      ],
    )
  ],
);
}
}
