class Empleado {
  int _id = 0;
  String _nombre = "";
  double _precio = 0;
  double _cantidad = 0;
  double _total = 0;
  Empleado(this._id, this._nombre, this._precio, this._cantidad, this._total);

  //getter
  int get id => _id;
  String get nombre => _nombre;
  double get precio => _precio;
  double get cantidad => _cantidad;
  double get total => _total;

  //setter
  set id(int v) {
    _id = v;
  }

  set nombre(String v) {
    _nombre = v;
  }

  set precio(double v) {
    _precio = v;
  }

  set cantidad(double v) {
    _cantidad = v;
  }

  set total(double v) {
    _total = v;
  }
}
