import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rancho_ala22/Animation/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

TextEditingController nombreRegistro = TextEditingController();
TextEditingController apellidosRegistro = TextEditingController();
TextEditingController gradoRegistro = TextEditingController();
TextEditingController cedulaRegistro = TextEditingController();
TextEditingController correoRegistro = TextEditingController();
TextEditingController codigoRegistro = TextEditingController();

TextEditingController contrasenaRegistro = TextEditingController();

class Registro extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String _validatorPassword(String value) {
  if (!_hasMinLenght(value)) {
    return 'Contraseña debil';
  }
}

bool _hasMinLenght(String value) {
  return value.isNotEmpty && value.length >= 8;
}

class _HomePageState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();

  final RegExp phoneRegex = RegExp(r'^[0]\d{9}$');
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  //Lista de grados
  List<String> list_grados = ['Soldado', 'Sargento', 'Capitán', 'Coronel'];
  String grado_registro;
  //Lista de Unidad
  List<String> list_unidad = [
    'Unidad rescate',
    'Unidad de Soldados',
    'Unidad de Oficiales',
    'Unidad de Capitanes'
  ];
  String unidad_registro;

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
                height: 250,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      height: 250,
                      width: width + 20,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/fond1_fae1.png'),
                                    fit: BoxFit.fill)),
                          )),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Text(
                        'Registro de Usuario',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 90,
                      child: Center(
                          child: Text(
                        'F.A.E',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //
                          //Ingreso del Nombre
                          Text(
                            'Nombres',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ingrese nombres",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: nombreRegistro,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor ingrese Nombre';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          // Fin del ingreso nombre
                          SizedBox(
                            height: 15,
                          ),
                          //Ingreso del Apellido
                          Text(
                            'Apellidos',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ingrese apellidos",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: apellidosRegistro,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor ingrese Apellido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          // Fin del ingreso apellidos
                          SizedBox(
                            height: 15,
                          ),
                          //Ingreso del grado
                          Text(
                            'Grado',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: DropdownButton(
                                    hint: Text(
                                        'Selecciona tu Grado'), // Not necessary for Option 1
                                    value: grado_registro,
                                    onChanged: (newValue) {
                                      setState(() {
                                        grado_registro = newValue;
                                        //  print(grado_registro);
                                      });
                                    },
                                    items: list_grados.map((grado) {
                                      return DropdownMenuItem(
                                        child: new Text(grado),
                                        value: grado,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )),

                          SizedBox(
                            height: 15,
                          ),

                          //Ingreso del Unidad
                          Text(
                            'Unidad',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: DropdownButton(
                                    hint: Text(
                                        'Selecciona tu Unidad'), // Not necessary for Option 1

                                    value: unidad_registro,
                                    onChanged: (newValue) {
                                      setState(() {
                                        unidad_registro = newValue;
                                        //  print(grado_registro);
                                      });
                                    },

                                    items: list_unidad.map((unidad) {
                                      return DropdownMenuItem(
                                        child: new Text(unidad),
                                        value: unidad,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )),
                          // Fin del ingreso Unidad

                          SizedBox(
                            height: 15,
                          ),

                          //Ingreso de Cedula
                          Text(
                            'Cedula',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ingrese su Cedula",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: cedulaRegistro,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]*$')),
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    validator: (value) {
                                      if (!phoneRegex.hasMatch(value)) {
                                        return 'Por favor ingrese cedula valida';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          // Fin del ingreso Cedula
                          SizedBox(
                            height: 15,
                          ),

                          //Ingreso del Correo
                          Text(
                            'Correo',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "@fae.mil.ec",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: correoRegistro,
                                    validator: (value) {
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Email no valido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          // Fin del ingreso Correo
                          SizedBox(
                            height: 15,
                          ),

                          //Ingreso del Codigo
                          Text(
                            'Codigo',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ingrese Codigo",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.code_sharp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: codigoRegistro,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor ingrese Codigo';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          // Fin del ingreso Codigo

                          //Ingreso Contraseña
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Contraseña',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                      color: Color.fromRGBO(196, 135, 198, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    )
                                  ]),
                              child: Container(
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
                                    controller: contrasenaRegistro,
                                    validator: (value) =>
                                        _validatorPassword(value)),
                              ),
                            ),
                          ),
                          //Fin Ingreso Contraseña

                          SizedBox(
                            height: 30,
                          ),

                          /* BotonRegistro */

                          FadeAnimation(
                              1.9,
                              InkWell(
                                onTap: () async {
                                  print(grado_registro);
                                  if (_formKey.currentState.validate()) {
                                    var url = Uri.parse(
                                        'http://192.168.10.107:3000/usuario/create');
                                    print(url);
                                    var response = await http.post(url, body: {
                                      'grado': grado_registro,
                                      'rol': "Cliente",
                                      'nombre': nombreRegistro.text,
                                      'apellido': apellidosRegistro.text,
                                      'cedula': cedulaRegistro.text,
                                      'unidad': unidad_registro,
                                      'correo': correoRegistro.text,
                                      'contrasena': contrasenaRegistro.text,
                                      'codigo': codigoRegistro.text,
                                    });
                                    if (response.statusCode == 200) {
                                      var jsonResponse =
                                          convert.jsonDecode(response.body)
                                              as Map<String, dynamic>;
                                      var isUser = jsonResponse['cedula'];

                                      if (isUser == cedulaRegistro.text) {
                                        print('Error de registro');
                                        Fluttertoast.showToast(
                                            msg:
                                                "Error de registro - Usuario Registrado",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1);

                                        cedulaRegistro.clear();
                                        nombreRegistro.clear();
                                        apellidosRegistro.clear();
                                        contrasenaRegistro.clear();
                                        gradoRegistro.clear();

                                        correoRegistro.clear();
                                        codigoRegistro.clear();
                                        //Retroceder
                                        Navigator.pop(context);
                                      } else {
                                        print('Registro con éxitoo');
                                        Fluttertoast.showToast(
                                            msg: "Registro con éxito " +
                                                nombreRegistro.text,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1);
                                        cedulaRegistro.clear();
                                        nombreRegistro.clear();
                                        apellidosRegistro.clear();
                                        contrasenaRegistro.clear();
                                        gradoRegistro.clear();

                                        correoRegistro.clear();
                                        codigoRegistro.clear();
                                        Navigator.pop(context);
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
                                      "Registrar",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),

                          //fin Boton Registro
                          SizedBox(
                            height: 30,
                          ),

                          /* BotonLogin */

                          FadeAnimation(
                              1.9,
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
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
                                      "Regresar",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),

                          //fin Boton Login
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

  @override
  void dispose() {
    super.dispose();
  }
}
