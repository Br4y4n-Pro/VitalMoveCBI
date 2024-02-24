// ignore_for_file: file_names

class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Usuario {
  String? idUsuario;
  String? dni;
  String? apellidos;
  String? genero;
  String? direccion;
  String? dependencia;
  String? fechaNacimiento;
  String? talla;
  String? rh;
  String? nombreEmergencia;
  String? parentesco;
  String? telefonoEmergencia;
  String? eps;
  String? alergias;
  String? contrasena;

  Usuario({
    this.idUsuario,
    this.dni,
    this.apellidos,
    this.genero,
    this.direccion,
    this.dependencia,
    this.fechaNacimiento,
    this.talla,
    this.rh,
    this.nombreEmergencia,
    this.parentesco,
    this.telefonoEmergencia,
    this.eps,
    this.alergias,
    this.contrasena,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    idUsuario = datos['id_usuario'].toString();
    dni = datos['dni'].toString();
    apellidos = datos['apellidos'];
    genero = datos['genero'];
    direccion = datos['direccion'];
    dependencia = datos['dependencia'];
    fechaNacimiento = datos['fecha_nacimiento'];
    talla = datos['talla'].toString();
    rh = datos['rh'];
    nombreEmergencia = datos['nombre_emergencia'];
    parentesco = datos['parentesco'];
    telefonoEmergencia = datos['telefono_emergencia'].toString();
    eps = datos['eps'];
    alergias = datos['alergias'];
    contrasena = datos['contrasena'];
  }
}
