import 'package:flutter/material.dart';
import 'package:rancho_ala22/login_registro/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rancho Ala 22',
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
