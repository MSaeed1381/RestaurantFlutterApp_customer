import 'package:flutter/material.dart';
import 'package:snap_food/login.dart';
import 'package:snap_food/mainPage.dart';
import 'signUp.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap Food',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
      ),
      home: Login(),
    );
  }
}
