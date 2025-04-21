import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';


class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

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
        child: Text('Shop Screen'),
      ),
      bottomNavigationBar: NavBar()
    );
  }
}