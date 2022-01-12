import 'package:flutter/material.dart';
import 'package:rancho_ala22/login_registro/login.dart';
import 'package:rancho_ala22/restaurantes/restaurantesala22.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rancho_ala22/reservas/reserva.dart';
import 'package:rancho_ala22/reservas/Factura.dart';

void pre() async {
  SharedPreferences perfs = await SharedPreferences.getInstance();
  await perfs.clear();
}

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key key, this.idcliente}) : super(key: key);
  final int idcliente;
  @override
  MenuLateral1 createState() => MenuLateral1();
}

class MenuLateral1 extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
              ),
              child: Column(
                children: [
                  Text(
                    "Bienvenidos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Image.asset('assets/images/logo-ala22.png')),
                  Text(
                    "F.A.E Ala 22",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, size: 40),
            title: Text(
              "Perfil",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
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
          //storefront_sharp
          ListTile(
            leading: Icon(Icons.flatware_sharp, size: 40),
            title: Text(
              "Restaurantes",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        restaurante(idcliente: widget.idcliente)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt, size: 40),
            title: Text(
              "Pedidos",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ListaCompras(idcliente: widget.idcliente)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long_outlined, size: 40),
            title: Text(
              "Comprobante de pago",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ListaFactura(idcliente: widget.idcliente)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, size: 40),
            title: Text(
              "Cerrar sesión",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              pre();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
