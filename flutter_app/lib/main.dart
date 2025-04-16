import 'package:flutter/material.dart';

// import 'reusable_widgets.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen(),);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PETNAME'),
          actions: <Widget> [
              Padding(padding: const EdgeInsets.only(right: 16.0),
              child: RichText(text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.savings)),
                  TextSpan(text: "0", style: TextStyle(color: Colors.black, fontSize: 20)),
                ]
              )
              )
              )
          ],
        )

      )
    );
}
}

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

// }