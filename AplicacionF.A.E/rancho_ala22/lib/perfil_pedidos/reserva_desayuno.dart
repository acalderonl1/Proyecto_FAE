import 'package:flutter/material.dart';
import 'package:rancho_ala22/Widget_/widget_drawer_menu.dart';
import 'package:rancho_ala22/perfil_pedidos/confirmacion.dart';
import 'package:rancho_ala22/mensajes/error_pedido.dart';

int cantidadLunes = 0;
int cantidadTarrina = 0;
int cantidadTenedor = 0;
double totalCantidadL;
double totalTarrinaL;
double totalPlasL;
double totalLunes;

int cantidadMartes = 0;
int cantidadMiercoles = 0;
int cantidadJueves = 0;
int cantidadViernes = 0;
int cantidadSabado = 0;
int cantidadDomingo = 0;

double valor_desayuno = 1;
double precioTarrina = 0.50;
double precioTenedor = 0.25;

class reserva_desayuno extends StatefulWidget {
  @override
  reserva_dia createState() => reserva_dia();
}

class reserva_dia extends State<reserva_desayuno> {
  bool _expanded = false;
  bool tarrina = false;
  bool tarrinaMartes = false;
  bool tenedores = false;
  bool tenedoresMartes = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Reserva del desayuno',
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
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Container(
              height: 600,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(15),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                      title: Text(
                        'Lunes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        'Seleccione la cantidad de desayunos',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      leading: SizedBox(
                          height: 100.0,
                          width: 100.0, // fixed width and height
                          child: Image.asset('assets/dias/paisaje.png')),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                cantidadLunes--;
                                if (cantidadLunes < 0) {
                                  cantidadLunes = 0;
                                }
                                totalCantidadL = cantidadLunes.toDouble() * 2;
                                print(totalLunes);
                              });
                            }),
                        Expanded(
                            child: Center(
                          child: Text(cantidadLunes.toString(),
                              style: TextStyle(fontSize: 20)),
                        )),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              cantidadLunes++;
                              totalCantidadL =
                                  cantidadLunes.toDouble() * valor_desayuno;
                              print(totalLunes);
                            });
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Precio: ",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(valor_desayuno.toString(),
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text("Deseas tarrina?",
                          style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text("", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue[50])),
                          onPressed: () {
                            setState(() {
                              cantidadTarrina--;
                              if (cantidadTarrina < 0) {
                                cantidadTarrina = 0;
                              }
                              totalTarrinaL =
                                  cantidadTarrina.toDouble() * precioTarrina;
                              print(totalTarrinaL);
                            });
                          },
                          color: Colors.lightBlue[100],
                          child: GestureDetector(
                            child: IconButton(
                              icon: Icon(Icons.remove_circle_rounded),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: Text(cantidadTarrina.toString(),
                              style: TextStyle(fontSize: 20)),
                        )),
                        MaterialButton(
                          minWidth: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue[50])),
                          onPressed: () {
                            setState(() {
                              cantidadTarrina++;
                              totalTarrinaL =
                                  cantidadTarrina.toDouble() * precioTarrina;
                              print(cantidadTarrina);
                            });
                          },
                          color: Colors.lightBlue[100],
                          child: GestureDetector(
                            child: IconButton(
                              icon: Icon(Icons.add_circle_rounded),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text("Deseas Tenedor plastico?",
                          style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text("", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue[50])),
                          onPressed: () {
                            setState(() {
                              cantidadTenedor--;
                              if (cantidadTenedor < 0) {
                                cantidadTenedor = 0;
                              }
                              totalPlasL =
                                  cantidadTenedor.toDouble() * precioTenedor;
                              print(totalPlasL);
                            });
                          },
                          color: Colors.lightBlue[100],
                          child: GestureDetector(
                            child: IconButton(
                              icon: Icon(Icons.remove_circle_rounded),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: Text(cantidadTenedor.toString(),
                              style: TextStyle(fontSize: 20)),
                        )),
                        MaterialButton(
                          minWidth: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue[50])),
                          onPressed: () {
                            setState(() {
                              cantidadTenedor++;
                              totalPlasL =
                                  cantidadTenedor.toDouble() * precioTenedor;
                              print(totalLunes);
                            });
                          },
                          color: Colors.lightBlue[100],
                          child: GestureDetector(
                            child: IconButton(
                              icon: Icon(Icons.add_circle_rounded),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                            minWidth: 180.0,
                            height: 70.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmacion()),
                              );
                            },
                            color: Colors.green[300],
                            child: Text('Reservar',
                                style: TextStyle(fontSize: 20))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(15),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                      title: Text(
                        'Martes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        'Seleccione la cantidad de desayunos',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      leading: SizedBox(
                          height: 100.0,
                          width: 100.0, // fixed width and height
                          child: Image.asset('assets/dias/arbol.png')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                cantidadMartes--;
                                if (cantidadMartes < 0) {
                                  cantidadMartes = 0;
                                }
                                print(cantidadMartes);
                              });
                            }),
                        Expanded(
                            child: Center(
                          child: Text(cantidadMartes.toString(),
                              style: TextStyle(fontSize: 20)),
                        )),
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                cantidadMartes++;
                                print(cantidadMartes);
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // [Monday] checkbox
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: tarrinaMartes,
                              onChanged: (bool value) {
                                setState(() {
                                  tarrinaMartes = value;
                                  print(tarrinaMartes);
                                  if (tarrinaMartes == true) {
                                    print("Felicidades");
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Text("Tarrina (para llevar)"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: tenedoresMartes,
                              onChanged: (bool value) {
                                setState(() {
                                  tenedoresMartes = value;
                                  print(tenedoresMartes);
                                  if (tenedoresMartes == true) {
                                    print("Felicidadesx2");
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Text("Tenedor plastico    "),
                      ],
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
                                    builder: (context) => error_pedido()),
                              );
                            },
                            color: Colors.green[300],
                            child: Text('Reservar',
                                style: TextStyle(fontSize: 20))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
