class Reserva {
  int _id = 0;
  String _nombre = "";
  double _precio_desayuno = 0;
  double _cantidad_plato = 0;

  double _precio_tarrina = 0;
  double _cantidad_tarrina = 0;

  double _precio_tenedor = 0;
  double _cantidad_tenedor = 0;
  double _total = 0;

  Reserva(
      this._id,
      this._nombre,
      this._precio_desayuno,
      this._cantidad_plato,
      this._precio_tarrina,
      this._cantidad_tarrina,
      this._precio_tenedor,
      this._cantidad_tenedor,
      this._total);

  //getter
  int get id => _id;
  String get nombre => _nombre;

  double get precio_desayuno => _precio_desayuno;
  double get cantidad_plato => _cantidad_plato;

  double get precio_tarrina => _precio_tarrina;
  double get cantidad_tarrina => _cantidad_tarrina;

  double get precio_tenedor => _precio_tenedor;
  double get cantidad_tenedor => _cantidad_tenedor;

  double get total => _total;

  //setter
  set id(int v) {
    _id = v;
  }

  set nombre(String v) {
    _nombre = v;
  }

  set precio_desayuno(double v) {
    _precio_desayuno = v;
  }

  set cantidad_plato(double v) {
    _cantidad_plato = v;
  }

  set precio_tarrina(double v) {
    _precio_tarrina = v;
  }

  set cantidad_tarrina(double v) {
    _cantidad_tarrina = v;
  }

  set precio_tenedor(double v) {
    _precio_tenedor = v;
  }

  set cantidad_tenedor(double v) {
    _cantidad_tenedor = v;
  }

  set total(double v) {
    _total = v;
  }
}
