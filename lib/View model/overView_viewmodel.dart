// view_models/overview_view_model.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_ui/models/overview_model.dart';

class OverviewViewModel {
  final BuildContext context;

  OverviewViewModel(this.context);

  OverviewModel get overviewModel => Provider.of<OverviewModel>(context);

  void updateFollowers(int newFollowers) {
    overviewModel.updateFollowers(newFollowers);
  }

  void updateUnfollowed(int newUnfollowed) {
    overviewModel.updateUnfollowed(newUnfollowed);
  }
}