import 'package:flutter/material.dart';

class Dish {
  final String Nombre;
  final String Descripcion;
  // final IconData icon;
  final int tenedor;
  final int tarrina;
  final int cantidad;
  final double precio;
  final double total;

  Dish(
      {this.Nombre,
      this.Descripcion,
      /*  this.icon,*/
      this.tarrina,
      this.tenedor,
      this.cantidad,
      this.precio,
      this.total});
}
