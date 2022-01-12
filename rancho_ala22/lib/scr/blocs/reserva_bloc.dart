import 'dart:async';

import '../models/reserva.dart';

class Reserva1 {
  static List<Reserva> _plato_reserva_List = [
    Reserva(1, "Lunes", 1, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 1.5),
    Reserva(2, "Martes", 2, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 2),
    Reserva(3, "Miercoles", 1, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 1),
    Reserva(4, "Jueves", 2.5, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 2.5),
    Reserva(5, "Viernes", 3.5, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 3.5),
    Reserva(6, "Sabado", 3, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 3),
    Reserva(7, "Domingo", 7, 1.50, 1.50, 1, 1, 0.50, 0, 0.25, 0, 7),
  ];
  //Stream Controller
  final _comidaListStreamController = StreamController<List<Reserva>>();
  // Cantidad de platos de comida
  var _platoIncrementController = StreamController<Reserva>();
  var _platoDecrementController = StreamController<Reserva>();

  //cantidad de tarrinas

  var _tarrinaIncrementController = StreamController<Reserva>();
  var _tarrinaDecrementController = StreamController<Reserva>();
  //cantidad de tenedor
  var _tenedorIncrementController = StreamController<Reserva>();
  var _tenedorDecrementController = StreamController<Reserva>();

  var _empleadoSalarioAgregarStreamController = StreamController<Reserva>();

  //getter: Stream and Sinks
  Stream<List<Reserva>> get empleadoListStream =>
      _comidaListStreamController.stream;

  StreamSink<List<Reserva>> get empleadoListSink =>
      _comidaListStreamController.sink;

//plato de comida  Incrementplato
  StreamSink<Reserva> get IncrementplatoDesayuno =>
      _platoIncrementController.sink;
  StreamSink<Reserva> get DecrementplatoDesayuno =>
      _platoDecrementController.sink;
//Tarrina
  StreamSink<Reserva> get Incrementtarrina => _tarrinaIncrementController.sink;
  StreamSink<Reserva> get Decrementtarrina => _tarrinaDecrementController.sink;
// tenedor
  StreamSink<Reserva> get Incrementtenedor => _tenedorIncrementController.sink;
  StreamSink<Reserva> get Decrementtenedor => _tenedorDecrementController.sink;

  StreamSink<Reserva> get empleadoSalarioAgregar =>
      _empleadoSalarioAgregarStreamController.sink;

//_incrementotarrina
  // _decrementtarrina
  //constructor
  Reserva1() {
    _comidaListStreamController.add(_plato_reserva_List);
    //plato de comida--------------------
    _platoIncrementController.stream.listen(_incrementplatoDesayuno);
    _platoDecrementController.stream.listen(_decrementplatoDesayuno);
    //tarrina -----------------
    _tarrinaIncrementController.stream.listen(_incrementotarrina);
    _tarrinaDecrementController.stream.listen(_decrementtarrina);
    //----------------
    //tenedor
    _tenedorIncrementController.stream.listen(_incrementotenedor);
    _tenedorDecrementController.stream.listen(_decrementtenedor);

    _empleadoSalarioAgregarStreamController.stream.listen(_AgregarEmpleado);
  }

  //generar las funciones principales
  _incrementplatoDesayuno(Reserva objE) {
    //print(objE.id);
    double cantidadActual = objE.cantidad_plato;
    double cantidadIncrement = cantidadActual + 1;

    _plato_reserva_List[objE.id - 1].cantidad_plato =
        double.parse((cantidadIncrement).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  _decrementplatoDesayuno(Reserva objE) {
    double cantidadActual2 = objE.cantidad_plato;
    double cantidadDecremento = cantidadActual2 - 1;

    _plato_reserva_List[objE.id - 1].cantidad_plato =
        double.parse((cantidadDecremento).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  _incrementotarrina(Reserva objE) {
    double cantidadtarrina = objE.cantidad_tarrina;
    double cantidadIncrementotarrina = cantidadtarrina + 1;
    _plato_reserva_List[objE.id - 1].cantidad_tarrina =
        double.parse((cantidadIncrementotarrina).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  _decrementtarrina(Reserva objE) {
    double cantidadtarrina2 = objE.cantidad_tarrina;
    double decrementotarrina = cantidadtarrina2 - 1;
    _plato_reserva_List[objE.id - 1].cantidad_tarrina =
        double.parse((decrementotarrina).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  _incrementotenedor(Reserva objE) {
    double cantidadtenedor = objE.cantidad_tenedor;
    double Incrementotenedor = cantidadtenedor + 1;
    _plato_reserva_List[objE.id - 1].cantidad_tenedor =
        double.parse((Incrementotenedor).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  _decrementtenedor(Reserva objE) {
    double cantidadtenedor1 = objE.cantidad_tenedor;
    double decrementotenedor2 = cantidadtenedor1 - 1;
    _plato_reserva_List[objE.id - 1].cantidad_tenedor =
        double.parse((decrementotenedor2).toStringAsFixed(2));
    empleadoListSink.add(_plato_reserva_List);
  }

  // ignore: non_constant_identifier_names
  _AgregarEmpleado(Reserva objE) {
    objE.id = _plato_reserva_List.length - 1;
    _plato_reserva_List.add(objE);
    //print(_empleadoList.length);
    _comidaListStreamController.add(_plato_reserva_List);
  }

  void dispose() {
    _comidaListStreamController.close();

    _platoDecrementController.close();
    _platoIncrementController.close();

    _tarrinaDecrementController.close();
    _tarrinaIncrementController.close();

    _tenedorIncrementController.close();
    _tenedorDecrementController.close();

    _empleadoSalarioAgregarStreamController.close();
  }
}
