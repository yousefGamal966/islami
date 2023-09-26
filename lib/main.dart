import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ChapterDetails/ChapterDetails.dart';
import 'package:islami/MyThemeData.dart';
import 'package:islami/hadethDetails/HadethDetails.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/home/Splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
        create:(buildContext)=>SettingsProvider(),
          child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Islami',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingsProvider.currentTheme,
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('ar')
      ],
      locale: settingsProvider.currentLocale,

      routes: {
        Splash.routeName: (_) => Splash(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetails.routeName: (_) => ChapterDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
