import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taller2/scr/blocs/empleado_bloc.dart';
import 'package:taller2/scr/models/empleado.dart';
import 'package:taller2/scr/ui/empleado_page.dart';

class MyEmpleadoPageCreate extends StatefulWidget {
  const MyEmpleadoPageCreate({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyEmpleadoPageCreateState createState() => _MyEmpleadoPageCreateState();
}

class _MyEmpleadoPageCreateState extends State<MyEmpleadoPageCreate> {
  final _formKey = GlobalKey<FormState>();
  Empleado objEmpleado = Empleado(0, "", 0.0, 0, 0.0);
  EmpleadoBloc _empleadoBloc = EmpleadoBloc();
  //final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _txtCantidad = TextEditingController();
  final _txtPrecio = TextEditingController();
  final _txtNombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                children: <Widget>[
                  const Center(
                      child: Text(
                    "Crear Empleado",
                    style: TextStyle(fontSize: 25, color: Colors.black54),
                  )),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Ingrese el nombre',
                        labelText: 'Nombre'),
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    controller: _txtNombre,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      objEmpleado.nombre = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.money),
                        hintText: 'Ingrese el precio',
                        labelText: 'Precio'),
                    keyboardType: TextInputType.number,
                    controller: _txtPrecio,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    validator: (value) {
                      if (!phoneRegex.hasMatch(value!)) {
                        return 'Por favor ingrese un precio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      objEmpleado.precio =
                          double.parse(value.toString()); //.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.money),
                        hintText: 'Ingrese la Cantidad',
                        labelText: 'Cantidad'),
                    keyboardType: TextInputType.number,
                    controller: _txtCantidad,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    validator: (value) {
                      if (!phoneRegex.hasMatch(value!)) {
                        return 'Por favor ingrese cantidad';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      objEmpleado.cantidad =
                          double.parse(value.toString()); //.toString();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showToast("Datos Correctos");
                          //https://pub.dev/packages/page_transition
                          //context,  MaterialPageRoute(builder: (context) => Pag2()));
                          //Navigator.push(context,CupertinoPageRoute(builder: (context) => Pag2()));
                          //lista.add(user);
                          //lo agrego a una lista para despues listarlo mas adelante
                          /*SnackBar snackBar = SnackBar(
                            content: Text('Procesando información!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the Scaffold in the widget tree and use
                          // it to show a SnackBar.
                         CustomWidgets.buildErrorSnackbar(context,"Your message here");
                          */
                          // _empleadoBloc.empleadoSalarioDecrement.add(snapshot.data![index]);
                          _empleadoBloc.empleadoSalarioAgregar.add(objEmpleado);
                          //objEmpleado.id = 6;
                          _formKey.currentState!.save();
                          print('ID: ${objEmpleado.id}');
                          print('Nombre: ${objEmpleado.nombre}');
                          print('Precio: ${objEmpleado.precio}');
                          print('Cantidad: ${objEmpleado.cantidad}');

                          _txtNombre.clear();
                          _txtCantidad.clear();
                          _txtPrecio.clear();
                          /*ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Procesando info.')));*/
                        } else {
                          //showToast("Error, Ingrese los datos");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Error, Ingrese los datos')));
                        }
                      },
                      child: const Text('Registrar Empleado'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(

                            //https://pub.dev/packages/page_transition
                            // context,              MaterialPageRoute(builder: (context) => Pag2()));
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const EmpleadoPage()));
                      },
                      child: const Text('Listar Empleados'),
                    ),
                  )
                ],
              ))),
    );
  }

  //void showToast(String msg, {int? duration, required int gravity}) {
  void showToast(String msg, {int? duration, int? gravity}) {
    //Toast.show(msg, context, duration: duration, gravity: gravity);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  //List<User> lista = []; //genero una lista vacia
  final RegExp phoneRegex = RegExp(r'\d$');
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
}

class User {
  String name = "";
  String email = "";
  String phoneNo = "";
}
