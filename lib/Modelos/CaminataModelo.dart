// ignore_for_file: file_names

class Caminatas {
  List<Caminata> dato = [];
  Caminatas();

  Caminatas.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Caminata.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Caminata {
  int? idcaminata;
  int? idusuario;
  DateTime? fecha;
  double? fcr;
  double? tiempo;
  double? distancia;
  double? fcm;
  double? consumovo2;
  String? barevodos;

  Caminata(
      {this.idcaminata,
      this.barevodos,
      this.consumovo2,
      this.distancia,
      this.fcm,
      this.fcr,
      this.fecha,
      this.idusuario,
      this.tiempo});

  Caminata.fromJsonMap(Map<String, dynamic> datos) {
    idcaminata = datos['idcaminata'];
    idusuario = datos['idusuario'];
    fecha = datos['fecha'];
    fcr = datos['fcr'];
    tiempo = datos['fecha'];
    distancia = datos['distancia'];
    fcm = datos['fcm'];
    consumovo2 = datos['consumovo2'];
    barevodos = datos['barevodos'];
  }
}
