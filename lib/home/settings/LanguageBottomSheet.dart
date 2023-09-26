import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/SettingsProvider.dart';
class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: (){
                provider.changeLanguage(Locale('ar'));
              },
              child:provider.isEnglishEnabled()?getUnselectedItem(
                  unselectedLanguageName: AppLocalizations.of(context)!.arabic):
              getSelectedItem(selectedLanguageName: AppLocalizations.of(context)!.arabic)


          ),
          SizedBox(height: 15,),
          InkWell(
              onTap: (){
                provider.changeLanguage(Locale('en'));
              },
              child: provider.isEnglishEnabled()?
              getSelectedItem(selectedLanguageName: AppLocalizations.of(context)!.english):
              getUnselectedItem(unselectedLanguageName: AppLocalizations.of(context)!.english)

          ),
        ],
      ),
    );
  }

  Widget getSelectedItem({required String selectedLanguageName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selectedLanguageName,style:Theme.of(context).textTheme.titleMedium?.copyWith(color:Theme.of(context).dividerColor)

        ),
        Icon(Icons.check,color: Theme.of(context).dividerColor,)
      ],
    );

  }
  Widget getUnselectedItem({required String unselectedLanguageName}){
    return Row(
      children: [
        Text(unselectedLanguageName,style:Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
