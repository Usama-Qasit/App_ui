// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_ui/models/calendar_model.dart';
import 'package:testing_ui/Views/homepage.dart';

import 'Models/calendar_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalendarModel()),
        // Add other providers as needed
      ],
      child: MyApp(),
    ),
  );
}

class MultiProvider {
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffF2F4F7),
      ),
      home: HomeScreen(),
    );
  }
}