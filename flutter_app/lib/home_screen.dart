import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// ignore: must_be_immutable
class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() { 
    super.initState();
    getUserPreferences(); // Load user preferences when the app starts
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopAppbar(),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(placeholderImagePath),
                //   fit: BoxFit.cover,
                // ), //Can load in background image
                color: currentBackGroundColour,
              ),
            ),
            Center(
              child: Image.asset(
                placeholderImagePath,
                width: 200,
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sugar');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // child: 
                
              ),
            )
          ],
        ),
        bottomNavigationBar: NavBar()
      );
  }
}