import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/reusable_widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2, 
      child: Scaffold(
        appBar: AppBar( //Copy of TopAppbar but with TabBar attached to it, done because other screens don't use tabbar
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
          bottom: TabBar(
            // controller: TabController(length: 2, vsync: ScrollableState()),
            // indicatorColor: Colors.blue,
            tabs: <Widget> [
              Tab(text: 'Pets'),
              Tab(text: 'Backgrounds'),
            ],
          ),
        ),
          body: TabBarView(
            children: <Widget> [
              ListView.builder( //Pets
                itemCount: boughtPetsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(placeholderImagePath),
                    title: Text('${boughtPetsList.keys.elementAt(index)}, ${petsPricesList[boughtPetsList.keys.elementAt(index)].toString()}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showCustomDialog(
                          context, 
                          'Buy ${boughtPetsList.keys.elementAt(index)}', //title 
                          'Do you want to buy ${boughtPetsList.keys.elementAt(index)} for ${petsPricesList[boughtPetsList.keys.elementAt(index)]}?', //description
                          petsPricesList[boughtPetsList.keys.elementAt(index)] ?? 0, //moneyAmount
                          boughtPetsList[boughtPetsList.keys.elementAt(index)] ?? false, //isOwned 
                          () { //onPressed Function
                            if (boughtPetsList[boughtPetsList.keys.elementAt(index)] == true) {
                              // Show a message indicating the pet is already owned
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('You already own this pet!')),
                              );
                            } else {
                              // Proceed with the purchase
                              if (currentMoney >= (petsPricesList[boughtPetsList.keys.elementAt(index)] ?? 0)) {
                                  currentMoney -= (petsPricesList[boughtPetsList.keys.elementAt(index)] ?? 0); // Deduct the money amount from currentMoney
                                  boughtPetsList[boughtPetsList.keys.elementAt(index)] = true; // Set the pet as owned
                                  setUserPreferences(); // Save the new currentMoney value
                              } else {
                                // Show a message indicating insufficient funds
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Insufficient funds!')),
                                );

                              }
                            }
                          }
                        );

                      },
                    ),
                  );
                },
              ),
              ListView.builder( //Backgrounds
                itemCount: boughtBackgroundsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(placeholderImagePath),
                    title: Text('${boughtBackgroundsList.keys.elementAt(index)}, ${backgroundsPricesList[boughtBackgroundsList.keys.elementAt(index)].toString()}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showCustomDialog(
                          context, 
                          'Buy ${boughtBackgroundsList.keys.elementAt(index)}', //title 
                          'Do you want to buy ${boughtBackgroundsList.keys.elementAt(index)} for ${backgroundsPricesList[boughtBackgroundsList.keys.elementAt(index)]}?', //description
                          backgroundsPricesList[boughtBackgroundsList.keys.elementAt(index)] ?? 0, //moneyAmount
                          boughtBackgroundsList[boughtBackgroundsList.keys.elementAt(index)] ?? false, //isOwned 
                          () { //onPressed Function
                            if (boughtBackgroundsList[boughtBackgroundsList.keys.elementAt(index)] == true) {
                              // Show a message indicating the pet is already owned
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('You already own this backgrounds!')),
                              );
                            } else {
                              // Proceed with the purchase
                              if (currentMoney >= (backgroundsPricesList[boughtBackgroundsList.keys.elementAt(index)] ?? 0)) {
                                  currentMoney -= (backgroundsPricesList[boughtBackgroundsList.keys.elementAt(index)] ?? 0); // Deduct the money amount from currentMoney
                                  boughtBackgroundsList[boughtBackgroundsList.keys.elementAt(index)] = true; // Set the pet as owned
                                  setUserPreferences(); // Save the new currentMoney value
                              } else {
                                // Show a message indicating insufficient funds
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Insufficient funds!')),
                                );

                              }
                            }
                          }
                        );

                      },
                    ),
                  );
                },
              ),
            ]
          ),
        bottomNavigationBar: NavBar()
      ),
    ) ;
  }
}