import 'package:flutter/material.dart';
import 'package:islami/MyThemeData.dart';
// import 'package:islami/home/Azkar/AzkarTab.dart';
import 'package:islami/home/Hadeth/HadethTab.dart';
import 'package:islami/home/Quran/QuranTab.dart';
import 'package:islami/home/Radio/RadioTab.dart';
import 'package:islami/home/Sebha/SebhaTab.dart';
import 'package:islami/home/settings/SettingsTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                provider.getBackgroundImage()

              ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_name,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: 'Quran'),),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap:(index){
            setState(() {
              selectedTabIndex=index;
            });

          },
          currentIndex: selectedTabIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/quran.png')),
                label:AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor:Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                label: AppLocalizations.of(context)!.praise),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/radio.png')),
                label: AppLocalizations.of(context)!.radio),

            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }
}
