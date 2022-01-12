import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:flutter/material.dart';
import 'package:rancho_ala22/reservas/serializacion/serializacion.dart';

class ListaFactura extends StatefulWidget {
  const ListaFactura({Key key, this.idcliente}) : super(key: key);
  final int idcliente;
  @override
  _ListaFactura createState() => _ListaFactura();
}

double total;

class _ListaFactura extends State<ListaFactura> {
  Future<List<Reserva>> getDataReserva(idcliente) async {
    http.Response response = await http.get(
        Uri.parse(
            'http://192.168.68.103:3000/usuario/datafactura/$idcliente'), //url
        headers: {"Accept": "application/json"});
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = convert.jsonDecode(response.body);
      List<Reserva> users = data.map((data) => Reserva.fromJson(data)).toList();
      return users;
    });
  }

  @override
  void initState() {
    print(widget.idcliente.hashCode);
    print(widget.idcliente.toString());

    this.getDataReserva(widget.idcliente);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue[800],
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'Comprobante de pago',
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
                  MaterialPageRoute(
                      builder: (context) =>
                          Perfil_user(idcliente: widget.idcliente)),
                );
              },
            ),
          ],
        ),
        drawer: MenuLateral(idcliente: widget.idcliente),
        body: Container(
          child: FutureBuilder<List<Reserva>>(
              future: getDataReserva(widget.idcliente),
              builder: (context, data) {
                if (data.connectionState != ConnectionState.waiting &&
                    data.hasData) {
                  var userList = data.data;
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        var userData = userList[index];
                        /* return ExpansionTile(
                          key: Key("$index"),
                          title: Text(userData.cantidad ?? ""),
                        );*/

                        return Card(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.all(17),
                            elevation: 20,
                            child: Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: 40,
                                  right: 20,
                                ),
                                // height: 500,

                                child: Column(children: <Widget>[
                                  Center(
                                      child: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            alignment: Alignment.bottomLeft,
                                            icon: new Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                            onPressed: () async {
                                              var id = userData.idreserva;
                                              print(userData.idreserva);
                                              var url = Uri.parse(
                                                  'http://192.168.68.103:3000/reserva/update/$id');
                                              // Await the http get response, then decode the json-formatted response.
                                              var response = await http.put(url,
                                                  body: {'estado': "E"});
                                              this.getDataReserva(
                                                  widget.idcliente);

                                              Fluttertoast.showToast(
                                                  msg: "Reserva eliminada",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1);
                                              if (response.statusCode == 200) {
                                                this.setState(() {});
                                              }
                                            },
                                          ),
                                        ]),
                                    Text(
                                      " Reserva # " +
                                          userData.idreserva.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80.0,
                                          width: 80.0,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                              image: new AssetImage(
                                                  'assets/images/soldado3.png'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: userData.menudia
                                                  .map((Menudia_) {
                                                return new Column(
                                                  children: [
                                                    new Text(
                                                      "        " + Menudia_.dia,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    new Column(
                                                      children: Menudia_
                                                          .tiporancho
                                                          .map((modelComedor) {
                                                        return new Text(
                                                          "           " +
                                                              modelComedor
                                                                  .nombretiporancho,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    )
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                            // SizedBox(width: 200),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Comedor: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children:
                                              userData.menudia.map((Menudia_) {
                                            return new Column(
                                              children: [
                                                new Column(
                                                  children: Menudia_.comedor
                                                      .map((modelComedor) {
                                                    return new Text(
                                                      modelComedor.nombre,
                                                    );
                                                  }).toList(),
                                                )
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Menu: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children:
                                              userData.menudia.map((Menudia_) {
                                            return new Column(
                                              children: [
                                                new Column(
                                                  children: Menudia_.menu
                                                      .map((modelComedor) {
                                                    return new Text(
                                                      modelComedor.descripcion,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      ),
                                                    );
                                                  }).toList(),
                                                )
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Precio: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children:
                                              userData.menudia.map((Menudia_) {
                                            return new Column(
                                              children: [
                                                new Text(
                                                  double.parse(Menudia_.precio)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Cantidad: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              double.parse(userData.cantidad)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total a pagar: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children:
                                              userData.menudia.map((Menudia_) {
                                            return new Column(
                                              children: [
                                                new Text(
                                                  " ${total = double.parse(Menudia_.precio) * double.parse(userData.cantidad)}",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                  ])),
                                  SizedBox(height: 35)
                                ])));
                      });
                } else {
                  return Center(
                      child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      strokeWidth: 10,
                    ),
                  ));
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.reply_sharp, size: 30),
        ),
      ),
    );
  }
}
