import 'package:flutter/material.dart';
import 'package:personal_expenses/HomeFolder/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple, accentColor: Colors.yellow[600]),
    );
  }
}
