import 'dart:async';

import '../models/empleado.dart';

class EmpleadoBloc {
  static List<Empleado> _empleadoList = [
    Empleado(1, "Miguel", 110, 1, 100),
    Empleado(2, "Juan", 200, 1, 200),
    Empleado(3, "Ana", 300, 2, 600),
    Empleado(4, "Luis", 400, 3, 1200),
  ];
  //Stream Controller
  final _empleadoListStreamController = StreamController<List<Empleado>>();
  var _empleadoSalarioIncrementStreamController = StreamController<Empleado>();
  var _empleadoSalarioDecrementStreamController = StreamController<Empleado>();
  var _empleadoSalarioAgregarStreamController = StreamController<Empleado>();

  //getter: Stream and Sinks
  Stream<List<Empleado>> get empleadoListStream =>
      _empleadoListStreamController.stream;
  StreamSink<List<Empleado>> get empleadoListSink =>
      _empleadoListStreamController.sink;

  StreamSink<Empleado> get empleadoSalarioIncrement =>
      _empleadoSalarioIncrementStreamController.sink;
  StreamSink<Empleado> get empleadoSalarioDecrement =>
      _empleadoSalarioDecrementStreamController.sink;
  StreamSink<Empleado> get empleadoSalarioAgregar =>
      _empleadoSalarioAgregarStreamController.sink;

  //constructor
  EmpleadoBloc() {
    _empleadoListStreamController.add(_empleadoList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementStreamController.stream.listen(_decrementSalario);
    _empleadoSalarioAgregarStreamController.stream.listen(_AgregarEmpleado);
  }
  //generar las funciones principales
  _incrementSalario(Empleado objE) {
    //print(objE.id);
    double cantidadActual = objE.cantidad;
    double cantidadIncrement = cantidadActual + 1;

    _empleadoList[objE.id - 1].cantidad =
        double.parse((cantidadIncrement).toStringAsFixed(2));
    empleadoListSink.add(_empleadoList);
  }

  _decrementSalario(Empleado objE) {
    double cantidadActual2 = objE.cantidad;
    double cantidadDecremento = cantidadActual2 - 1;

    _empleadoList[objE.id - 1].cantidad =
        double.parse((cantidadDecremento).toStringAsFixed(2));
    empleadoListSink.add(_empleadoList);
  }

  // ignore: non_constant_identifier_names
  _AgregarEmpleado(Empleado objE) {
    objE.id = _empleadoList.length - 1;
    _empleadoList.add(objE);
    //print(_empleadoList.length);
    _empleadoListStreamController.add(_empleadoList);
  }

  void dispose() {
    _empleadoListStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioAgregarStreamController.close();
  }
}
