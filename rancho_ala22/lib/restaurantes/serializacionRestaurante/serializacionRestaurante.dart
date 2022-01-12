class Comedor2 {
  String nombrecomedor;
  int id_grado_bajo;
  int id_grado_alto;
  Comedor2({this.nombrecomedor, this.id_grado_bajo, this.id_grado_alto});
  factory Comedor2.fromJson(Map<String, dynamic> parsedJson) {
    return Comedor2(
        nombrecomedor: parsedJson['nombre'],
        id_grado_bajo: parsedJson['id_grado_bajo'],
        id_grado_alto: parsedJson['id_grado_alto']);
  }
}

class Reparto3 {
  String nombreReparto;
  List<Comedor2> comedor1;
  Reparto3({this.nombreReparto, this.comedor1});
  factory Reparto3.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['comedors'] as List;
    List<Comedor2> comedor2 = list.map((i) => Comedor2.fromJson(i)).toList();
    return Reparto3(nombreReparto: parsedJson['nombre'], comedor1: comedor2);
  }
}

// ignore: camel_case_types
class Usuario_restaurante {
  // ignore: non_constant_identifier_names
  String nombre_per;
  Reparto3 reparto;
  Usuario_restaurante(
      {
      // ignore: non_constant_identifier_names
      this.nombre_per,
      this.reparto});
  factory Usuario_restaurante.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario_restaurante(
        nombre_per: parsedJson['nombres'],
        reparto: Reparto3.fromJson(parsedJson['reparto']));
  }
}
