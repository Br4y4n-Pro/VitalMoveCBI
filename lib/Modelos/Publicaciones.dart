// ignore_for_file: file_names

class Publicaciones {
  List<Publicacion> dato = [];
  Publicaciones();

  Publicaciones.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Publicacion.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Publicacion {
  String? fecha;
  String? idpublicacion;
  String? imagen;
  String? recomendaciones;

  Publicacion(
      {this.fecha, this.idpublicacion, this.imagen, this.recomendaciones});

  Publicacion.fromJsonMap(Map<dynamic, dynamic> datos) {
    fecha = datos['fecha'];
    idpublicacion = datos['idpublicacion'];
    imagen = datos['imagen'];
    recomendaciones = datos['recomendaciones'];
  }
}
