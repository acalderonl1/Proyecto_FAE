import '../blocs/empleado_bloc.dart';
import '../models/empleado.dart';
import 'package:flutter/material.dart';

class EmpleadoPage extends StatefulWidget {
  const EmpleadoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _EmpleadoPageState createState() => _EmpleadoPageState();
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  EmpleadoBloc _empleadoBloc = EmpleadoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de dias"),
      ),
      body: Container(
        child: StreamBuilder<List<Empleado>>(
          stream: _empleadoBloc.empleadoListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot) {
            var empleados = snapshot.data ?? [];
            return ListView.builder(
              itemCount: empleados.length,
              itemBuilder: (context, index) {
                //var dataEmp = snapshot.data![index];
                //print(empleados[index].nombre);
                //print(empleados.length);

                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(
                              Icons.people,
                              color: Colors.cyan,
                            ),
                          ),
                          title: Text(
                            empleados[index].nombre,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text(
                            "cantidad: ${empleados[index].cantidad} \$precio: ${empleados[index].precio} \$total :${empleados[index].precio * empleados[index].cantidad} ",
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.green),
                          ),
                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                  color: Colors.blue,
                                  icon: const Icon(Icons.add_box_outlined),
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalarioIncrement
                                        .add(empleados[index]);
                                    //print(empleados[index].nombre);
                                  }),
                              IconButton(
                                  color: Colors.red,
                                  icon:
                                      const Icon(Icons.do_disturb_on_outlined),
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);
                                    //_empleadoBloc.empleadoSalarioDecrement.add(snapshot.data![index]);
                                  }),
                            ],
                          ))
                    ],
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
