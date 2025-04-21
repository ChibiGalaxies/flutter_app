// This file contains global variables that can be used throughout the app.
// It includes variables for the current money, pet name, and current index.
import 'package:shared_preferences/shared_preferences.dart';
  
  int currentMoney = 500;
  String petName = "Flamey";
  int currentIndex = 1;

  //paths for images
  String placeholderImagePath = "assets/placeholder.png";



  getUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentMoney = prefs.getInt('currentMoney') ?? 500;
    petName = prefs.getString('petName') ?? "Flamey";
  }

  setUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentMoney', currentMoney);
    prefs.setString('petName', petName);
  }