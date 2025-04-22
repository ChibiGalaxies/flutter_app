import 'package:flutter/material.dart';

// Importing screens
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/settings_screen.dart';
import 'package:flutter_app/shop_screen.dart';
import 'package:flutter_app/sugar_measuring_screen.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  FlutterApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/pet',
      routes: {
        '/settings': (context) => SettingsScreen(),
        '/pet': (context) => HomeScreen(),
        '/shop': (context) => ShopScreen(),
        '/sugar': (context) => SugarMeasuringScreen(),
      },);
  }
}