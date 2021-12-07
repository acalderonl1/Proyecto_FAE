import 'package:flutter/material.dart';

class Dish {
  final String name;
  final String descripcion;

  final double sub_cantidad;
  
  final double sub_Tarrina;

  final double sub_Tenedor;

  final double cantidadComida;
  final double cantidadTarrina;
  final double cantidadTenedor;

  final double precioComida;
  final double precioTarrina;
  final double precioTenedor;

  final IconData icon;
  final IconData iconmas;
  final IconData iconMenos;
  final Color color;

  Dish(
      {this.name,
      this.descripcion,
      // ignore: non_constant_identifier_names
      this.sub_cantidad,
      // ignore: non_constant_identifier_names
      this.sub_Tarrina,
      // ignore: non_constant_identifier_names
      this.sub_Tenedor,
      this.cantidadComida,
      this.cantidadTarrina,
      this.cantidadTenedor,
      this.precioComida,
      this.precioTarrina,
      this.precioTenedor,
      this.icon,
      this.iconmas,
      this.iconMenos,
      this.color});
}
