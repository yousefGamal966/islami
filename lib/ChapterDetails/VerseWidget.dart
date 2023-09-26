import 'package:flutter/material.dart';
import 'package:islami/ChapterDetails/ChapterDetails.dart';

class VerseWidget extends StatelessWidget {
String content;
int index;
VerseWidget(this.content,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        child: Text('$content[${index+1}]',style:Theme.of(context).textTheme.bodyMedium
        ,textDirection: TextDirection.rtl,textAlign: TextAlign.center));
  }
}
