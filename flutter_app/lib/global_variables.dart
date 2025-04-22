// This file contains global variables that can be used throughout the app.
// It includes variables for the current money, pet name, and current index.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
  
  int currentMoney = 500;
  String petName = "Flamey";
  int currentIndex = 1;
  var currentBackGroundColour = Colors.grey;
  var currentPetImagePath = "assets/placeholder.png";

  //TODO: Change this from Maps to an SQL database or something similar.
  Map<String, bool> boughtPetsList = {
    'default': true,
    'flame': false,
    'water': false,
    'leaf': false,
  };
  Map<String, int> petsPricesList = {
    'default': 0,
    'flame': 100,
    'water': 200,
    'leaf': 300,
  };
  Map<String, bool> boughtBackgroundsList = {
    'default': true,
    'blue': false,
    'red': false,
    'green': false,
  };
  Map<String, int> backgroundsPricesList = {
    'default': 0,
    'blue': 100,
    'red': 200,
    'green': 300,
  };
  Map<String, MaterialColor> backgroundColoursList = {
    'default': Colors.grey,
    'blue': Colors.blue,
    'red': Colors.red,
    'green': Colors.green,
  };

  //paths for images
  String placeholderImagePath = "assets/placeholder.png";



  getUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentMoney = prefs.getInt('currentMoney') ?? 500;
    petName = prefs.getString('petName') ?? "Flamey";
    int colorString = prefs.getInt('currentBackGroundColour') ?? 0;
    currentBackGroundColour = backgroundColoursList.values.elementAt(colorString);
  }

  setUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentMoney', currentMoney);
    prefs.setString('petName', petName);
    prefs.setInt('currentBackGroundColour', backgroundColoursList.keys.toList().indexOf(currentBackGroundColour.toString()));
  }