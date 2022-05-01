// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:example/src/components/accordions.dart';
import 'package:example/src/screens/components_page.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "TheSans",
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          //bodyText2: TextStyle(fontSize: 20),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        drawerTheme: DrawerThemeData(),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => SdxComponentPage(),
      },
    );
  }
}
