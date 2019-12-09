import 'package:e_commerce_app/pages/LoginSignup/LoginSignPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[200],
        fontFamily: 'VarelaRound',
      ),
      home: Scaffold(
        body: LoginSignPage(),
      ),
    );
  }
}
