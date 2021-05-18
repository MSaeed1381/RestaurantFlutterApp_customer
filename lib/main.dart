import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/mainPage.dart';
import 'Screens/signUp.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snap Food',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
      ),
      home: Login(),
    );
  }
}
