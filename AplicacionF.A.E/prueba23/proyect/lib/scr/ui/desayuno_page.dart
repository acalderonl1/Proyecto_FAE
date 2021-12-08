import '../blocs/reserva_bloc.dart';
import '../models/reserva.dart';
import 'package:flutter/material.dart';

class EmpleadoPage extends StatefulWidget {
  const EmpleadoPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _EmpleadoPageState createState() => _EmpleadoPageState();
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  Reserva1 _reservaBloc = Reserva1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Dias"),
      ),
      body: Container(
        child: StreamBuilder<List<Reserva>>(
          stream: _reservaBloc.empleadoListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Reserva>> snapshot) {
            var empleados = snapshot.data ?? [];

            return ListView.builder(
              itemCount: empleados.length,
              itemBuilder: (context, index) {
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
                    elevation: 20,
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
                          /*  trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                  color: Colors.blue,
                                  icon: const Icon(Icons.add_box_outlined),
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalarioIncrement
                                        .add(empleados[index]);
                                    print(empleados[index].cantidad);
                                  }),
                              IconButton(
                                  color: Colors.red,
                                  icon:
                                      const Icon(Icons.do_disturb_on_outlined),
                                  onPressed: () {
                                    if (empleados[index].cantidad <= 1) {
                                      empleados[index].cantidad = 1;
                                    } else {
                                      _empleadoBloc.empleadoSalarioDecrement
                                          .add(snapshot.data![index]);
                                      print(empleados[index].cantidad);
                                    }

                                    /*   _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);*/
                                  }),
                            ],
                          ),*/
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
                                    _reservaBloc.Decrementplato.add(
                                        snapshot.data![index]);
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

                                  _reservaBloc.Incrementplato.add(
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
                          ' Selecciona cantidad de tarrinas',
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
                                        snapshot.data![index]);
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
                          'Deseas el Tenedor ? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          ' Selecciona cantidad de tenedor',
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
                                        snapshot.data![index]);
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
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                                minWidth: 200.0,
                                height: 70.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                onPressed: () {
                                  /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmacion()),
                              );*/
                                },
                                color: Colors.green[300],
                                child: Text('Reservar',
                                    style: TextStyle(fontSize: 20))),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
