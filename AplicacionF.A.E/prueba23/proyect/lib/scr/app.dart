import 'package:taller2/scr/ui/desayuno_page.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EmpleadoPage(
          title: 'Empleados UPS',
        ),
      ),
    );
  }
}
