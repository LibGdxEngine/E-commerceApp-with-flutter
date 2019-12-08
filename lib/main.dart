import 'package:flutter/material.dart';
import 'package:new_ecommerce/pages/LoginSignPage.dart';

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
