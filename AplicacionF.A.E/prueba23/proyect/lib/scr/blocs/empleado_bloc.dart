import 'dart:async';

import '../models/empleado.dart';

class Reserva1 {
  static List<Reserva> _empleadoList = [
    Reserva(1, "Lunes", 1.5, 1, 0.50, 0, 0.25, 0, 1.5),
    Reserva(2, "Martes", 2, 1, 0.50, 0, 0.25, 0, 2),
    Reserva(3, "Miercoles", 1, 1, 0.50, 0, 0.25, 0, 1),
    Reserva(4, "Jueves", 2.5, 1, 0.50, 0, 0.25, 0, 2.5),
    Reserva(5, "Viernes", 3.5, 1, 0.50, 0, 0.25, 0, 3.5),
    Reserva(6, "Sabado", 3, 1, 0.50, 0, 0.25, 0, 3),
    Reserva(7, "Domingo", 7, 1, 0.50, 0, 0.25, 0, 7),
  ];
  //Stream Controller
  final _empleadoListStreamController = StreamController<List<Reserva>>();
  var _platoIncrementController = StreamController<Reserva>();
  var _platoDecrementController = StreamController<Reserva>();
  var _empleadoSalarioAgregarStreamController = StreamController<Reserva>();

  //getter: Stream and Sinks
  Stream<List<Reserva>> get empleadoListStream =>
      _empleadoListStreamController.stream;
  StreamSink<List<Reserva>> get empleadoListSink =>
      _empleadoListStreamController.sink;

  StreamSink<Reserva> get Incrementplato => _platoIncrementController.sink;
  StreamSink<Reserva> get Decrementplato => _platoDecrementController.sink;
  StreamSink<Reserva> get empleadoSalarioAgregar =>
      _empleadoSalarioAgregarStreamController.sink;

  //constructor
  EmpleadoBloc() {
    _empleadoListStreamController.add(_empleadoList);

    _platoIncrementController.stream.listen(_incrementplato);
    _platoDecrementController.stream.listen(_decrementSalario);

    _empleadoSalarioAgregarStreamController.stream.listen(_AgregarEmpleado);
  }

  //generar las funciones principales
  _incrementplato(Reserva objE) {
    //print(objE.id);
    double cantidadActual = objE.cantidad_plato;
    double cantidadIncrement = cantidadActual + 1;

    _empleadoList[objE.id - 1].cantidad_plato =
        double.parse((cantidadIncrement).toStringAsFixed(2));
    empleadoListSink.add(_empleadoList);
  }

  _decrementSalario(Reserva objE) {
    double cantidadActual2 = objE.cantidad_plato;
    double cantidadDecremento = cantidadActual2 - 1;

    _empleadoList[objE.id - 1].cantidad_plato =
        double.parse((cantidadDecremento).toStringAsFixed(2));
    empleadoListSink.add(_empleadoList);
  }

  // ignore: non_constant_identifier_names
  _AgregarEmpleado(Reserva objE) {
    objE.id = _empleadoList.length - 1;
    _empleadoList.add(objE);
    //print(_empleadoList.length);
    _empleadoListStreamController.add(_empleadoList);
  }

  void dispose() {
    _empleadoListStreamController.close();
    _platoDecrementController.close();
    _platoIncrementController.close();
    _empleadoSalarioAgregarStreamController.close();
  }
}
