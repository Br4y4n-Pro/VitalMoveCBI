// ignore_for_file: file_names

class Historiales {
  List<Historial> dato = [];
  Historiales();

  Historiales.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Historial.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Historial {
  int? idhistorial;
  String? fecha;
  String? peso;
  int? idusuario;
  String? imc;
  String? imcdescripcion;

  Historial({
    this.idhistorial,
    this.fecha,
    this.peso,
    this.idusuario,
    this.imc,
    this.imcdescripcion,
  });

  Historial.fromJsonMap(Map<String, dynamic> datos) {
    idhistorial = datos['idhistorial'];
    fecha = datos['fecha'];
    peso = datos['peso'];
    idusuario = datos['idusuario'];
    imc = datos['imc'];
    imcdescripcion = datos['imcdescripcion'];
  }
}
