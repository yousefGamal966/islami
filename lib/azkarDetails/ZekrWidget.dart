import 'package:flutter/material.dart';
import 'package:islami/ChapterDetails/ChapterDetails.dart';

class ZekrWidget extends StatelessWidget {
String content;

ZekrWidget(this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        child: Text('$content',style: TextStyle(
          fontSize: 20,fontFamily: 'Quran'
        ),textDirection: TextDirection.rtl,textAlign: TextAlign.center));
  }
}
