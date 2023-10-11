import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
              child: provider.isDarkEnabled()?
              getUnselectedItem(
                  unselectedThemeName: AppLocalizations.of(context)!.light):
              getSelectedItem(selectedThemeName: AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
              child:
              provider.isDarkEnabled()?
              getSelectedItem(selectedThemeName: AppLocalizations.of(context)!.dark):
              getUnselectedItem(
                  unselectedThemeName: AppLocalizations.of(context)!.dark)


          )
        ],
      ),
    );
  }

  Widget getSelectedItem({required String selectedThemeName}) {
    var provider = SettingsProvider();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedThemeName,
          style: TextStyle(fontSize: 25, color: Theme.of(context).dividerColor
            ,fontFamily: provider.changeLanguageTheme(),fontWeight: FontWeight.bold
          ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }

  Widget getUnselectedItem({required String unselectedThemeName}) {
    var provider = SettingsProvider();
    return Container(
      width: double.infinity,
      child: Text(unselectedThemeName,
          style: TextStyle(
            fontSize: 25,fontFamily: provider.changeLanguageTheme(),
          )),
    );
  }
}
