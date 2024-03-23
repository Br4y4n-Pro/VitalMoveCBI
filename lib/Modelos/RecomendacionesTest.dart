// ignore_for_file: file_names

class Recomendaciones {
  List<Recomendacion> dato = [];
  Recomendaciones();

  Recomendaciones.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Recomendacion.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Recomendacion {
  String? descripcion;
  int? idtests;

  Recomendacion({this.descripcion, this.idtests});

  Recomendacion.fromJsonMap(Map<dynamic, dynamic> datos) {
    descripcion = datos['descripcion'];
    idtests = datos['idtests'];
  }
}
