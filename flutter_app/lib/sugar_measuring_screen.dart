import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';

//Most of the code responsible for running the sugar input screen, this is found through a button on homescreen.
//Additional code for appbar and navbar are in resusable_widgets.dart

class SugarMeasuringScreen extends StatefulWidget {
  const SugarMeasuringScreen({super.key});

  @override
  State<SugarMeasuringScreen> createState() => _SugarMeasuringScreenState();
}

class _SugarMeasuringScreenState extends State<SugarMeasuringScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppbar(),
      body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Loads a title and a textfield for the sugar input
                Text("Sugar Tracker", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                TextfieldCode(
                  hintText: 'Input sugar amount', 
                  controller: TextEditingController(), 
                  iconData: Icons.cookie,
                  onSubmitted: (String value) {
                  // Handle sugar level submission
                  // print("Sugar level submitted: $value");
                  sugarAmount = double.parse(value); 
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sugar level submitted: $value')));
                  Navigator.of(context).pop();
                }
              )
            ],),
          ),
      bottomNavigationBar: NavBar()
    );
  }
}