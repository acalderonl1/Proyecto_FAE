import 'package:flutter/material.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/perfil_pedidos/comidas.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class restaurante extends StatefulWidget {
  const restaurante({Key key, this.idcliente}) : super(key: key);
  final int idcliente;
  @override
  restaurant createState() => restaurant();
}

// ignore: camel_case_types
class restaurant extends State<restaurante> {
  String grado = "Soldado";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "",
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
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "Bienvenido user",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Center(
                      child: Text(
                        'F.A.E',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Restaurante #1',
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 40.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green[700])),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => comidas(
                                    idcliente: widget.idcliente,
                                    idrestaurant: 1)),
                          );
                        },
                        color: Colors.green[300],
                        child: GestureDetector(
                          child: Image.asset('assets/images/restaurante.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Restaurante #2',
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 40.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green[700])),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => comidas(
                                    idcliente: widget.idcliente,
                                    idrestaurant: 2)),
                          );
                          if (grado == "Soldado") {
                            Fluttertoast.showToast(
                                msg:
                                    "$grado Usted no puede insgresar al restaurante 2",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1);
                          }
                        },
                        color: Colors.orange[200],
                        child: GestureDetector(
                          child: Image.asset('assets/images/restaurantes.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )),
          ],
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
