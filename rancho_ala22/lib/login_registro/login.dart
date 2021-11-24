import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/Animation/FadeAnimation.dart';
import '/login_registro/registro.dart';
import '/login_registro/recuperar_contrasena.dart';
import 'package:rancho_ala22/utilities/constants.dart';
import 'package:rancho_ala22/perfil_pedidos/restaurantes.dart';
import 'package:rancho_ala22/perfil_pedidos/comidas.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
/*
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
*/
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController UsernameLogin = new TextEditingController();
  TextEditingController PasswordLogin = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      height: 400,
                      width: width,
                      child: FadeAnimation(
                          1,
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/fond2_fae2.png'),
                                    fit: BoxFit.fill)),
                          ))),
                    ),
                    Positioned(
                      height: 400,
                      width: width + 20,
                      child: FadeAnimation(
                          1.3,
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/fond1_fae1.png'),
                                    fit: BoxFit.fill)),
                          ))),
                    ),
                    Positioned(
                      top: 110,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          child: Image.asset('assets/images/logo-ala22.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Text(
                        'Rancho F.A.E',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Text(
                        'Ala 22',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                              1.5,
                              Center(
                                  child: Text(
                                "Bienvenidos ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: 'OpenSans'),
                                textAlign: TextAlign.center,
                              ))),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.5,
                              Text(
                                "Usuario",
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              1.7,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[200]))),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Ingrese username",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                prefixIcon: Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              controller: UsernameLogin,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Por favor ingrese Usuario';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.5,
                              Text(
                                "Contraseña",
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              1.7,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60.0,
                                            child: TextFormField(
                                              obscureText: true,
                                              style: TextStyle(
                                                fontFamily: 'OpenSans',
                                              ),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(top: 14.0),
                                                prefixIcon: Icon(
                                                  Icons.lock,
                                                  color: Colors.black,
                                                ),
                                                hintText: 'Ingrese contraseña',
                                              ),
                                              controller: PasswordLogin,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Por favor ingrese Contraseña';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.7,
                              InkWell(
                                onTap: () {},
                                child: new Center(
                                    child: Text(
                                  "¿Olvidaste tu contraseña?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(196, 135, 198, 1)),
                                )),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.9,
                              InkWell(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    var user = UsernameLogin.text;
                                    var passw = PasswordLogin.text;
                                    var url = Uri.parse(
                                        'http://192.168.10.110:3000/usuario/login/$user/$passw');
                                    print(url);
                                    // Await the http get response, then decode the json-formatted response.
                                    var response = await http.get(url);
                                    if (response.statusCode == 200) {
                                      var jsonResponse =
                                          convert.jsonDecode(response.body)
                                              as Map<String, dynamic>;
                                      var isUser = jsonResponse['msg'];

                                      var id = jsonResponse['is_user'];
                                      var nombre = jsonResponse['nombre'];
                                      var apellido = jsonResponse['apellido'];
                                      var correo = jsonResponse['correo'];
                                      var fecha_ =
                                          jsonResponse['fecha_creacion'];
                                      SharedPreferences perfs =
                                          await SharedPreferences.getInstance();
                                      perfs.setInt('idUser', id);
                                      perfs.setString('Nombre', nombre);
                                      perfs.setString('Apellido', apellido);
                                      perfs.setString('Correo', correo);
                                      perfs.setString('fecha', fecha_);

                                      if (isUser == '1') {
                                        print("Login correcto");
                                        Fluttertoast.showToast(
                                            msg: "Login correcto " + nombre,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  restaurante()),
                                        );
                                        UsernameLogin.clear();
                                        PasswordLogin.clear();
                                      } else {
                                        print("Revise su usuario y contrasena");
                                        Fluttertoast.showToast(
                                            msg:
                                                "Revise su usuario y contrasena",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1);
                                        UsernameLogin.clear();
                                        PasswordLogin.clear();
                                      }
                                    } else {
                                      print(
                                          'Falla al conectar al API REST: ${response.statusCode}.');
                                    }
                                  }
                                },
                                child: new Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Iniciar sesión",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.9,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registro()),
                                  );
                                },
                                child: new Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Registro de usuario",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/*
  @override
  void dispose() {
    super.dispose();
    UsernameLogin.dispose();
    PasswordLogin.dispose();
  }*/
}
