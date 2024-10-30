// models/overview_model.dart
import 'package:flutter/material.dart';

class OverviewModel extends ChangeNotifier {
  int followers = 254680;
  int unfollowed = 152;
  double malePercentage = 0.42;
  double femalePercentage = 0.58;
  List<double> salesData = [200.0, 80.0, 150.0, 0.0, 160.0, 70.0, 220.0]; // Change to List<double>

  void updateFollowers(int newFollowers) {
    followers = newFollowers;
    notifyListeners();
  }

  void updateUnfollowed(int newUnfollowed) {
    unfollowed = newUnfollowed;
    notifyListeners();
  }
}