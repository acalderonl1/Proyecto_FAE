import 'package:taller2/scr/ui/empleado_create.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyEmpleadoPageCreate(
          title: 'Empleados UPS',
        ),
      ),
    );
  }
}
