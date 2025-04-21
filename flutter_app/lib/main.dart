import 'package:flutter/material.dart';
// import 'package:flutter_app/reusable_widgets.dart'; //isn't used Yet
// import 'package:flutter_app/global_variables.dart';

// Importing screens
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/settings_screen.dart';
import 'package:flutter_app/shop_screen.dart';

// import 'reusable_widgets.dart';

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
      },);
  }
}