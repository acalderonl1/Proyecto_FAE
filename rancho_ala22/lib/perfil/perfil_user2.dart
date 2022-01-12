import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:rancho_ala22/perfil/serializacionperfil.dart';

class Perfil2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

String Username1;
String NombresPersona;
String telefono;
String correo;
String dni;
String NombreReparto;
String NombreGrado;

//Color(0xFF242E56)
class _MyAppState extends State<Perfil2> {
  List<Usuario> persona_Usuario;

  Future<String> getUsuario() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://192.168.68.103:3000/usuario/dataperfilpersona/1'), //url
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        persona_Usuario = (convert.json.decode(response.body) as List)
            .map((i) => Usuario.fromJson(i))
            .toList();
      });
      Username1 = persona_Usuario[0].username;
      NombresPersona = persona_Usuario[0].persona.nombres;
      telefono = persona_Usuario[0].persona.telefono;
      correo = persona_Usuario[0].persona.correo;
      dni = persona_Usuario[0].persona.dni;
      NombreReparto = persona_Usuario[0].persona.reparto.nombreReparto;
      NombreGrado = persona_Usuario[0].persona.grado.nombregrado;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

  @override
  void initState() {
    this.getUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'Perfil Usuario',
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
              },
            ),
          ],
        ),
        drawer: MenuLateral(),
        backgroundColor: Color(0xFF242E56),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 600,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      padding: EdgeInsets.only(
                        top: 30,
                        left: 40,
                        right: 20,
                      ),
                      // height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Column(
                            children: [
                              // color: Colors.teal,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        children: [
                                          Text(
                                            "      " + NombreGrado.toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff242E56)),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "     " + NombresPersona.toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
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
                                    "Username: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Username1.toString(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 125),
                                    ],
                                  ),
                                ],
                              ),
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
                                    "DNI: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        dni.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width: 100),
                                    ],
                                  ),
                                ],
                              ),
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
                                    "Correo: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        correo.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width: 80),
                                    ],
                                  ),
                                ],
                              ),
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
                                    "Reparto: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        NombreReparto.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width: 150),
                                    ],
                                  ),
                                ],
                              ),
                              //    Image.asset("assets/dias/arbol.png"),
                              SizedBox(height: 40),
                              Container(
                                  width: 500,
                                  color: Colors.white,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF242E56),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text("Actualizar datos"),
                                      ))),
                            ],
                          )),
                        ],
                      ),
                    ),
                    /*       Padding(
                        padding: const EdgeInsets.only(top: 40, left: 130),
                        child: Column(
                          children: [
                            Container(
                              height: 180.0,
                              width: 180.0,
                              decoration: new BoxDecoration(
                                image: DecorationImage(
                                  image: new AssetImage(
                                      'assets/images/soldado.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            /* CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  "https://st2.depositphotos.com/3369547/11378/v/950/depositphotos_113787590-stock-illustration-man-design-male-avatar-icon.jpg"),
                            ),*/
                            SizedBox(height: 8),
                            /* Text(
                              NombresPersona.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )*/
                          ],
                        )),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
