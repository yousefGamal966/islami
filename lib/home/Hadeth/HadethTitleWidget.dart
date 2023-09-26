import 'package:flutter/material.dart';
import 'package:islami/hadethDetails/HadethDetails.dart';
import 'package:islami/home/Hadeth/Hadeth.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;
    HadethTitleWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments:hadeth );
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4),
          child: Text(hadeth.title,style:Theme.of(context).textTheme.labelMedium)),
    );
  }
}
