import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

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
              setUserPreferences(); // Save the new pet name
              }
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar()
    );
  }
}