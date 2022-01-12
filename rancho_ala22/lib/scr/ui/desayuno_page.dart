import '../blocs/reserva_bloc.dart';
import '../models/reserva.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/mensajes/confirmacion.dart';
import 'package:rancho_ala22/mensajes/error_pedido.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:rancho_ala22/scr/ui/serializaciondesayuno_page.dart';

class DesayunodoPage extends StatefulWidget {
  const DesayunodoPage(
      {Key key, this.idcliente, this.idrestaurant, this.idtiporancho})
      : super(key: key);
  final int idcliente;
  final int idrestaurant;
  final int idtiporancho;
  @override
  _EmpleadoPageState createState() => _EmpleadoPageState();
}

class _EmpleadoPageState extends State<DesayunodoPage> {
  Reserva1 _reservaBloc = Reserva1();
  Future<List<Menudiadesayuno>> getDataDesayuno(
      idtiporancho, idrestaurant) async {
    http.Response response = await http.get(
        Uri.parse(
            'http://192.168.68.103:3000/usuario/datatiporancho/$idtiporancho/$idrestaurant'), //url
        headers: {"Accept": "application/json"});
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = convert.jsonDecode(response.body);
      List<Menudiadesayuno> users =
          data.map((data) => Menudiadesayuno.fromJson(data)).toList();
      return users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Reserva del desayuno',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.person,
              size: 40,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Perfil Usuario ;)",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil_user()),
              );
            },
          ),
        ],
      ),
      drawer: MenuLateral(),
      body: Container(
        child: StreamBuilder<List<Reserva>>(
          stream: _reservaBloc.empleadoListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Reserva>> snapshot) {
            var empleados = snapshot.data ?? [];

            return ListView.builder(
              itemCount: empleados.length,
              itemBuilder: (context, index) {
                var userData = empleados[index];

                //var dataEmp = snapshot.data![index];
                //print(empleados[index].nombre);
                //print(empleados.length);

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 2.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(15),
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading:
                              // fixed width and height
                              Image.asset('assets/images/desayuno.png'),
                          title: Text(
                            empleados[index].nombre,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Total a pagar : ${empleados[index].total = (empleados[index].precio_desayuno * empleados[index].cantidad_plato) + (empleados[index].precio_tarrina * empleados[index].cantidad_tarrina) + (empleados[index].precio_tenedor * empleados[index].cantidad_tenedor)} ",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                color: Colors.red,
                                icon: const Icon(Icons.do_disturb_on_outlined,
                                    size: 30),
                                onPressed: () {
                                  if (empleados[index].cantidad_plato <= 1) {
                                    empleados[index].cantidad_plato = 1;
                                  } else {
                                    /*     empleados[index].total =
                                        empleados[index].precio *
                                            empleados[index].cantidad;*/
                                    _reservaBloc.DecrementplatoDesayuno.add(
                                        snapshot.data[index]);
                                    print(empleados[index].cantidad_plato);
                                  }

                                  /*   _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);*/
                                }),
                            Expanded(
                                child: Center(
                              child: Text(
                                  empleados[index].cantidad_plato.toString(),
                                  style: TextStyle(fontSize: 20)),
                            )),
                            IconButton(
                                color: Colors.blue,
                                icon: const Icon(Icons.add_box_outlined,
                                    size: 30),
                                onPressed: () {
                                  /*   empleados[index].total =
                                      empleados[index].precio *
                                          empleados[index].cantidad;*/

                                  _reservaBloc.IncrementplatoDesayuno.add(
                                      empleados[index]);
                                  print(empleados[index].cantidad_plato);
                                }),
                            Expanded(
                              child: Center(
                                child: Text("Precio: ",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                    empleados[index].precio_desayuno.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Deseas el plato para llevar ? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Tarina +  Cubierto',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                color: Colors.red,
                                icon: const Icon(Icons.do_disturb_on_outlined,
                                    size: 30),
                                onPressed: () {
                                  if (empleados[index].cantidad_tarrina <= 0) {
                                    empleados[index].cantidad_tarrina = 0;
                                  } else {
                                    /*     empleados[index].total =
                                        empleados[index].precio *
                                            empleados[index].cantidad;*/
                                    _reservaBloc.Decrementtarrina.add(
                                        snapshot.data[index]);
                                    print("Cantidad de tarrina");
                                    print(empleados[index].cantidad_tarrina);
                                  }

                                  /*   _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);*/
                                }),
                            Expanded(
                                child: Center(
                              child: Text(
                                  empleados[index].cantidad_tarrina.toString(),
                                  style: TextStyle(fontSize: 20)),
                            )),
                            IconButton(
                                color: Colors.blue,
                                icon: const Icon(Icons.add_box_outlined,
                                    size: 30),
                                onPressed: () {
                                  /*   empleados[index].total =
                                      empleados[index].precio *
                                          empleados[index].cantidad;*/

                                  _reservaBloc.Incrementtarrina.add(
                                      empleados[index]);
                                  print(empleados[index].cantidad_tarrina);
                                }),
                            Expanded(
                              child: Center(
                                child: Text("Precio: ",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                    empleados[index].precio_tarrina.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Deseas cubierto ? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          ' Selecciona cantidad de cubierto',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                color: Colors.red,
                                icon: const Icon(Icons.do_disturb_on_outlined,
                                    size: 30),
                                onPressed: () {
                                  if (empleados[index].cantidad_tenedor <= 0) {
                                    empleados[index].cantidad_tenedor = 0;
                                  } else {
                                    /*     empleados[index].total =
                                        empleados[index].precio *
                                            empleados[index].cantidad;*/
                                    _reservaBloc.Decrementtenedor.add(
                                        snapshot.data[index]);
                                    print("Cantidad de tarrina");
                                    print(empleados[index].cantidad_tenedor);
                                  }

                                  /*   _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);*/
                                }),
                            Expanded(
                                child: Center(
                              child: Text(
                                  empleados[index].cantidad_tenedor.toString(),
                                  style: TextStyle(fontSize: 20)),
                            )),
                            IconButton(
                                color: Colors.blue,
                                icon: const Icon(Icons.add_box_outlined,
                                    size: 30),
                                onPressed: () {
                                  /*   empleados[index].total =
                                      empleados[index].precio *
                                          empleados[index].cantidad;*/

                                  _reservaBloc.Incrementtenedor.add(
                                      empleados[index]);
                                  print(empleados[index].cantidad_tenedor);
                                }),
                            Expanded(
                              child: Center(
                                child: Text("Precio: ",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                    empleados[index].precio_tenedor.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                                minWidth: 200.0,
                                height: 70.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Reserva realizada con exito",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Confirmacion()),
                                  );
                                },
                                color: Colors.green[300],
                                child: Text('Reservar',
                                    style: TextStyle(fontSize: 20))),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.reply_sharp, size: 30),
      ),
    );
  }
}
