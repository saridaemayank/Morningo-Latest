import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:morningo/Pages/HomePage.dart';
import 'package:morningo/Pages/SetupPage.dart';
import 'package:morningo/Pages/Splash_Screen.dart';
import 'package:morningo/Pages/Startup/welcome_page.dart';
import 'package:morningo/Pages/Tools/TodoPage/TodoPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Caviar Dreams'),
      home: Todo_Main(), // ApplashScreen, NavigationController
    ),
  );
}
