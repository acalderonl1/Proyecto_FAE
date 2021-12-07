import 'package:flutter/material.dart';
import '../carro_compra/cart.dart';
import '../carro_compra/dish_object.dart';

int tenedorcarro;
int tarrinacarro;
int cantidadcarro = 0;
double preciocarro;
double totalcarro;

class carro_compras extends StatefulWidget {
  @override
  compracarro createState() => compracarro();
}

class compracarro extends State<carro_compras> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = List<Dish>();

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservar Desayuno"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildListView(),
    );
  }

  ListView _buildListView() {
    int cantidadLunes = 0;
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];

        return Container(
          height: 400,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(15),
            elevation: 10,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: SizedBox(
                      // fixed width and height
                      child: Image.asset(
                    'assets/dias/paisaje.png',
                    height: 200.0,
                    width: 100.0,
                  )),
                  title: Text(
                    item.Nombre,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  trailing: GestureDetector(
                    child: (!_cartList.contains(item))
                        ? Icon(
                            Icons.add_circle,
                            size: 30,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.remove_circle,
                            size: 30,
                            color: Colors.red,
                          ),
                    onTap: () {
                      setState(() {
                        if (!_cartList.contains(item)) {
                          _cartList.add(item);
                        } else {
                          _cartList.remove(item);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        Nombre: 'Lunes',
        //  icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        cantidad: 10 + 6,
        //   cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Martes',
        //    icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //    cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Miercoles',
        //      icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //    cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Jueves',
        //     icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //     cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Viernes',
        //    icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //     cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Sabado',
        //       icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comida',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //     cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
      Dish(
        Nombre: 'Domingo',
        //    icon: Icons.fastfood,
        Descripcion: 'Ingres nombre del plato de comidas',
        tenedor: tenedorcarro,
        tarrina: tarrinacarro,
        //   cantidad: cantidadLunes,
        precio: preciocarro,
        total: totalcarro,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
