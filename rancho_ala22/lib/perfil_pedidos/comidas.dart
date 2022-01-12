import 'package:flutter/material.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/scr/ui/desayuno_page2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';

int cantidad = 1;

class comidas extends StatefulWidget {
  const comidas({Key key, this.idcliente, this.idrestaurant}) : super(key: key);
  final int idcliente;
  final int idrestaurant;
  @override
  com createState() => com();
}

class com extends State<comidas> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Comidas',
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
                MaterialPageRoute(builder: (context) => Perfil_user()),
              );
            },
          ),
        ],
      ),
      drawer: MenuLateral(),
      body: SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(17),
              elevation: 20,
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text(
                      'Desayuno',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Nombre del desayuno',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    leading: SizedBox(
                      height: 200,
                      width: 100,
                      // fixed width and height
                      child: Image.asset(
                        'assets/images/desayuno.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          minWidth: 160.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          onPressed: () {
                            /*
                             final int idcliente;
  final int idrestaurant;
  final int idtiporancho;
                            */
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Desayuno_page2(
                                      idcliente: widget.idcliente,
                                      idrestaurant: widget.idrestaurant,
                                      idtiporancho: 1)),
                            );
                          },
                          color: Colors.green[300],
                          child:
                              Text('Reservar', style: TextStyle(fontSize: 20))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(17),
              elevation: 20,
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text(
                      'Almuerzo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Nombre del Almuerzo',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    leading: SizedBox(
                      height: 200,
                      width: 100,
                      // fixed width and height
                      child: Image.asset(
                        'assets/images/almuerzo.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          minWidth: 160.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Desayuno_page2(
                                      idcliente: widget.idcliente,
                                      idrestaurant: widget.idrestaurant,
                                      idtiporancho: 2)),
                            );
                          },
                          color: Colors.green[300],
                          child:
                              Text('Reservar', style: TextStyle(fontSize: 20))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(17),
              elevation: 20,
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text(
                      'Merienda',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Nombre de la merienda',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    leading: SizedBox(
                      height: 200,
                      width: 100,
                      // fixed width and height
                      child: Image.asset(
                        'assets/images/meriendas.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          minWidth: 160.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Desayuno_page2(
                                      idcliente: widget.idcliente,
                                      idrestaurant: widget.idrestaurant,
                                      idtiporancho: 3)),
                            );
                          },
                          color: Colors.green[300],
                          child:
                              Text('Reservar', style: TextStyle(fontSize: 20))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
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
