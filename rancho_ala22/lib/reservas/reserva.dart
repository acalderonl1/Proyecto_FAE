import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';

import 'package:flutter/material.dart';
import 'package:rancho_ala22/reservas/serializacion.dart';

class ListaCompras extends StatefulWidget {
  const ListaCompras({Key key, this.idcliente}) : super(key: key);
  final String idcliente;

  @override
  _ListaComprasState createState() => _ListaComprasState();
}
/*
class Grado {
  final String nombrecorto;

  Grado({this.nombrecorto});

  factory Grado.fromJson(Map<String, dynamic> json) {
    return Grado(nombrecorto: json['nombrecorto']);
  }
}

class Persona {
  String nombres;
  Grado grado;
  Persona({this.nombres, this.grado});
  factory Persona.fromJson(Map<String, dynamic> parsedJson) {
    return Persona(
        nombres: parsedJson['nombres'],
        grado: Grado.fromJson(parsedJson['grado']));
  }
}*/

class API {
  static Future<void> getReserva() async {
    http.Response response = await http.get(
        Uri.parse('http://192.168.68.101:3000/usuario/datareserva/1'), //url
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      persona_reserva = (convert.json.decode(response.body) as List)
          .map((i) => Reserva.fromJson(i))
          .toList();
      print('${persona_reserva[0].cantidad}');
      print('${persona_reserva[0].menudia[0].dia}');
      print('${persona_reserva[0].menudia[0].tiporancho[0].nombretiporancho}');
      print('${persona_reserva[0].menudia[0].menu[0].descripcion}');
      print('${persona_reserva[0].menudia[0].comedor[0].nombre}');
      numero = persona_reserva.length;
      print(persona_reserva.length);
      print(numero.toString());
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}

// ignore: non_constant_identifier_names
List<Reserva> persona_reserva = [];
int numero;

class _ListaComprasState extends State<ListaCompras> {
  @override
  void initState() {
    API.getReserva();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Bienvenido ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.yellow[400],
            icon: new Icon(
              Icons.star_border_rounded,
              size: 37,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Star ;)",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1);
            },
          ),
        ],
      ),
      drawer: MenuLateral(),
      body: new ListView.builder(
        itemCount: persona_reserva == null ? 0 : persona_reserva.length,
        itemBuilder: (BuildContext context, int index) {
          numero = index;
          /*  child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),*/
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(17),
            elevation: 20,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Pefil del Usuario",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Center(
                  child: Text(
                    persona_reserva[index].cantidad,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " Menu dia:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                /*  SizedBox(
                  height: 10,
                ),
                Text(
                  persona_reserva[index].menudia[numero].dia,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22),
                ), 
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Menu:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  persona_reserva[index].menudia[index].menu[index].descripcion,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  persona_reserva[index]
                      .menudia[index]
                      .tiporancho[index]
                      .nombretiporancho,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  persona_reserva[index].menudia[index].comedor[index].nombre,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22),
                ),*/
              ],
            ),
          );
        },
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
