import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(placeholderImagePath),
                //   fit: BoxFit.cover,
                // ), //Can load in background image
                color: Colors.grey,
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
                    // Add your action here
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
      )
    );
}
}