import 'dart:async';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import '../MyThemeData.dart';



class Splash extends StatefulWidget {

  static const routeName = 'spalsh';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Center(
       child: Image.asset(
           provider.currentTheme == ThemeMode.dark?
           'assets/images/splash_dark.png':
           'assets/images/splash.jpg'


       ),
      ),

    );
  }
}
