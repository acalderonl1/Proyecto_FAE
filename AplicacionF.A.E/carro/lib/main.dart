import 'package:flutter/material.dart';
import 'cart.dart';
import 'dish_object.dart';

void main() => runApp(MyApp());
double cantidadComida_1 = 1;
double cantidadTarrina_1;
double cantidadTenedor_1;

double sub_cantidad_1;

double sub_Tarrina_1;

double sub_Tenedor_1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Place order'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(17),
            elevation: 20,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    item.descripcion,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  leading: Icon(
                    item.icon,
                    color: item.color,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(item.iconmas),
                      onPressed: () {
                        setState(() {
                          cantidadComida_1++;

                          item.cantidadComida.toDouble() ==
                              cantidadComida_1.toDouble();
                          print(cantidadComida_1);
                          print(item.cantidadComida);
                        });
                      },
                    ),
                    Expanded(
                        child: Center(
                      child: Text(item.cantidadComida.toString(),
                          style: TextStyle(fontSize: 20)),
                    )),
                    /*  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),*/

                    Expanded(
                      child: Center(
                        child: Text("Precio: ", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(item.precioComida.toString(),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      minWidth: 160.0,
                      height: 40.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      child: (!_cartList.contains(item))
                          ? Icon(
                              Icons.add_circle,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                      onPressed: () {
                        setState(() {
                          if (!_cartList.contains(item))
                            _cartList.add(item);
                          else
                            _cartList.remove(item);
                        });
                      },
                      color: Colors.green[300],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
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
        name: 'Lunes',
        descripcion: 'Arroz con pollo',
        cantidadComida: 1,
        cantidadTarrina: 0,
        cantidadTenedor: 0,
        precioComida: 2,
        precioTarrina: 0.50,
        precioTenedor: 0.25,
        sub_cantidad: 0,
        sub_Tarrina: 0,
        sub_Tenedor: 0,
        icon: Icons.fastfood,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.amber,
      ),
      Dish(
        name: 'Martes',
        descripcion: 'Sopa de fideos con arroz con carne',
        cantidadComida: 1,
        cantidadTarrina: 0,
        cantidadTenedor: 0,
        precioComida: 4,
        precioTarrina: 0.50,
        precioTenedor: 0.25,
        sub_cantidad: 0,
        sub_Tarrina: 0,
        sub_Tenedor: 0,
        icon: Icons.print,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Miercoles',
        descripcion: 'Arroz con lenteja',
        cantidadComida: 1,
        cantidadTarrina: 0,
        cantidadTenedor: 0,
        precioComida: 7,
        precioTarrina: 0.50,
        precioTenedor: 0.25,
        sub_cantidad: 0,
        sub_Tarrina: 0,
        sub_Tenedor: 0,
        icon: Icons.child_care,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.brown,
      ),
      Dish(
        name: 'Jueves',
        descripcion: 'Arroz con atun',
        cantidadComida: 1,
        cantidadTarrina: 0,
        cantidadTenedor: 0,
        precioComida: 3,
        precioTarrina: 0.50,
        precioTenedor: 0.25,
        sub_cantidad: 0,
        sub_Tarrina: 0,
        sub_Tenedor: 0,
        icon: Icons.whatshot,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.green,
      ),
      Dish(
        name: 'Viernes',
        descripcion: 'Verde',
        cantidadComida: 1,
        cantidadTarrina: 0,
        cantidadTenedor: 0,
        precioComida: 5,
        precioTarrina: 0.50,
        precioTenedor: 0.25,
        sub_cantidad: 0,
        sub_Tarrina: 0,
        sub_Tenedor: 0,
        icon: Icons.laptop,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.purple,
      ),
      Dish(
        name: 'Sabado',
        descripcion: 'Platano',
        icon: Icons.laptop_mac,
        iconmas: Icons.add,
        iconMenos: Icons.remove,
        color: Colors.blueGrey,
      ),
      Dish(
          name: 'Domingo',
          descripcion: 'Sopa de queso',
          icon: Icons.ad_units_outlined,
          iconmas: Icons.add,
          iconMenos: Icons.remove,
          color: Colors.amber),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
