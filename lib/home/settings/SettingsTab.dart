import 'package:flutter/material.dart';
import 'package:islami/home/settings/LanguageBottomSheet.dart';
import 'package:islami/home/settings/ThemeBottomSheet.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        SizedBox(height: 50,),
        Text(AppLocalizations.of(context)!.theme,style: TextStyle(
          fontSize: 18
        ),),
        InkWell(
          onTap: (){
            showThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color:Theme.of(context).dividerColor,width: 2),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.isDarkEnabled()?
                AppLocalizations.of(context)!.dark:
                AppLocalizations.of(context)!.light),
                Icon(Icons.keyboard_arrow_down_rounded,color: Theme.of(context).dividerColor,)
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        Text(AppLocalizations.of(context)!.language,style: TextStyle(
            fontSize: 25,fontFamily: provider.changeLanguageTheme(),
        ),),

        InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color:Theme.of(context).dividerColor,width: 2),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.isEnglishEnabled()?
                  AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic
                ),
                Icon(Icons.keyboard_arrow_down_rounded,color:Theme.of(context).dividerColor ,)
              ],
            ),
          ),
        )
      ],
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (context) {
      return ThemeBottomSheet();
    }, );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context, builder: (context) {
      return LanguageBottomSheet();

    },);
  }
}
