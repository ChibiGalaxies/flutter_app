import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';

//Settings screen for the app, allows you to input the pet name, which will be saved to sharedPreferences

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppbar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextfieldCode(hintText: 'pet name', 
            controller: TextEditingController(), 
            iconData: Icons.pets,
            onSubmitted: (String value) {
              petName = value;
              setPreferences(); // Save the new pet name
              }
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar()
    );
  }
}