import 'package:flutter/material.dart';
import 'package:islami/ChapterDetails/ChapterDetails.dart';

class ChapterTitleWidget extends StatelessWidget {
String title;
int index;
ChapterTitleWidget(this.title,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ChapterDetails.routeName,
            arguments:ChapterDetailsArgs(title, index) );
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4),
          child: Text(title,style: Theme.of(context).textTheme.labelLarge
          )),
    );
  }
}
