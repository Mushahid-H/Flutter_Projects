// import 'package:api_tutorial/home_screen.dart';
import 'package:api_tutorial/DartModels/home_screen4.dart';
import 'package:api_tutorial/DartModels/user_model.dart';
import 'package:api_tutorial/home_screen2.dart';
import 'package:api_tutorial/home_screen3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage4(),
    );
  }
}
