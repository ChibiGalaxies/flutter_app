import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(petName),
          actions: <Widget> [
              Padding(padding: const EdgeInsets.only(right: 16.0),
              child: RichText(text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.savings)),
                  TextSpan(text: "$currentMoney", style: TextStyle(color: Colors.black, fontSize: 20)),
                ]
              )
              )
              )
          ],
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            if (index == 0) {
              currentIndex = 0;
              Navigator.pushNamed(context, '/settings');
            } else if (index == 1) {
              currentIndex = 1;
              Navigator.pushNamed(context, '/pet');
            } else if (index == 2) {
              currentIndex = 2;
              Navigator.pushNamed(context, '/shop');
            }
          },
          indicatorColor: Colors.blue,
          selectedIndex: currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Pet',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop',
              )
          ]
        ),
    );
  }
}