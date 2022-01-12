import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:flutter/material.dart';
import 'package:rancho_ala22/restaurantes/serializacionRestaurante/serializacionRestaurante.dart';

class Restaurante_reparto extends StatefulWidget {
  const Restaurante_reparto({Key key, this.idcliente}) : super(key: key);
  final int idcliente;
  @override
  _ListaRestaurante_reparto createState() => _ListaRestaurante_reparto();
}

double total;
int reparto_persona;
int grado_persona;

// ignore: camel_case_types
class _ListaRestaurante_reparto extends State<Restaurante_reparto> {
  Future<Usuario_restaurante> _fetch() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://192.168.68.103:3000/usuario/dataRestaurant_reparto/1'), //url
        headers: {"Accept": "application/json"});
    await Future.delayed(Duration(seconds: 2), () {
      print(response.body);
      final decoded = convert.jsonDecode(response.body);
      final Usuario_restaurante companyInfo =
          Usuario_restaurante.fromJson(decoded);
      return companyInfo;
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    print(widget.idcliente);
    print(widget.idcliente.toString());

    this._fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pruebas"),
      ),
      body: FutureBuilder<Usuario_restaurante>(
        future: _fetch(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(10),
            child: snapshot.hasData
                ? Column(
                    children: [
                      // company detail
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.nombre_per,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(snapshot.data.reparto.nombreReparto),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // employee list
                      Expanded(
                          child: Card(
                        child: ListView(
                          children: snapshot.data.reparto.comedor1
                              .map(
                                (e) => ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(e.nombrecomedor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(e.id_grado_alto.toString()),
                                ),
                              )
                              .toList(),
                        ),
                      )),
                    ],
                  )
                : snapshot.hasError
                    ? Center(child: Text("Something went wrong"))
                    : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
