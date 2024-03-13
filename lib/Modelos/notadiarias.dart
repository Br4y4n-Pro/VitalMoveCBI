// ignore_for_file: file_names

class NotasDiarias {
  List<NotasDiaria> dato = [];
  NotasDiarias();

  NotasDiarias.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = NotasDiaria.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class NotasDiaria {
  String? descripcion;

  NotasDiaria({this.descripcion});

  NotasDiaria.fromJsonMap(Map<dynamic, dynamic> datos) {
    descripcion = datos['descripcion'];
  }
}
