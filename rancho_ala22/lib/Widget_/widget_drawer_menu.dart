import 'package:flutter/material.dart';
import 'package:rancho_ala22/login_registro/login.dart';
import 'package:rancho_ala22/perfil_pedidos/restaurantes.dart';
import 'package:rancho_ala22/perfil/perfil_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void pre() async {
  SharedPreferences perfs = await SharedPreferences.getInstance();
  await perfs.clear();
}

class MenuLateral extends StatelessWidget {
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
                color: Colors.lightBlue[600],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil_user()),
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
                MaterialPageRoute(builder: (context) => restaurante()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt, size: 40),
            title: Text(
              "Pedidos",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt_long_outlined, size: 40),
            title: Text(
              "Facturas",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
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
