import 'package:flutter/material.dart';

//importing from other files
import 'global_variables.dart';

class TopAppbar extends StatelessWidget implements PreferredSizeWidget {

  const TopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
        );
  }
}

class TextfieldCode extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData iconData;
  final bool isPasswordField;
  final dynamic onSubmitted;
  //Check how to manually save what variable to save text to.
  

  const TextfieldCode({
    super.key,
    required this.hintText,
    required this.controller,
    required this.iconData,
    this.isPasswordField = false,
    required this.onSubmitted, // Required as onSubmitted does different things in different screens
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordField,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSubmitted: onSubmitted
      ),
    );
  }
}

Future<void> showCustomDialog(BuildContext context, String title, String description, int moneyAmount, bool isOwned, dynamic onPressed) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          if (isOwned) ...[
            Text('Owned!'),
          ] else ...[
            Text('Price: $moneyAmount'),
          ],
          TextButton(
            child: Text('OK'),
            onPressed: () {
              onPressed(); // Call the onPressed function passed as a parameter
              // Close the dialog
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              // Close the dialog without any action
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}