import 'package:flutter/material.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userPreference;
String apellidoPreference;
String Correo;
String fecha;

/* const Perfil_user({Key key, this.idcliente}) : super(key: key);
  final String idcliente;*/

class Perfil_user extends StatefulWidget {
  @override
  perfil createState() => perfil();
}

/*
    perfs.setInt('idUser', id);
    perfs.setString('Nombre', nombre);
    perfs.setString('Apellido', apellido);
    perfs.setString('Correo', correo);
    perfs.setString('fecha', fecha_);
 */
void perfil_pre() async {
  SharedPreferences perfs = await SharedPreferences.getInstance();
  userPreference = perfs.getString('Nombre');
  apellidoPreference = perfs.getString('Apellido');
  Correo = perfs.getString('Correo');
  fecha = perfs.getString('fecha');
}

class perfil extends State<Perfil_user> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    perfil_pre();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Bienvenido ' + userPreference.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.person,
              size: 37,
            ),
            onPressed: () => print('envia al perfil del usuario, okis'),
          ),
        ],
      ),
      drawer: MenuLateral(),
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
                        'Perfil del usuario',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 40.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150),
                        ),
                        color: Colors.teal,
                        child: GestureDetector(
                          child: Image.asset('assets/images/soldado.png'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Nombre: ' + userPreference.toString(),
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Apellido : ' + apellidoPreference.toString(),
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Correo : ' + Correo.toString(),
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Fecha: ' + fecha.toString(),
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
