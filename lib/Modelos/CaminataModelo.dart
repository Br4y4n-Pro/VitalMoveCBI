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
  int? idusuario;
  String? fecha;
  String? fcr;
  String? tiempo;
  String? distancia;
  String? consumovo2;
  String? barevodos;
  String? fcm;
  int? idcaminata;
  int? idtest;
  Caminata(
      {this.barevodos,
      this.consumovo2,
      this.distancia,
      this.fcm,
      this.fcr,
      this.fecha,
      this.idusuario,
      this.tiempo,
      this.idcaminata,
      this.idtest});

  Caminata.fromJsonMap(Map<String, dynamic> datos) {
    idusuario = datos['idusuario'];
    fecha = datos['fecha'];
    fcr = datos['fcr'];
    tiempo = datos['tiempo'];
    distancia = datos['distancia'];
    fcm = datos['fcm'];
    consumovo2 = datos['consumovo2'];
    barevodos = datos['barevodos'];
    idcaminata = datos['idcaminata'];
    idtest = datos['idtest'];
  }
}
