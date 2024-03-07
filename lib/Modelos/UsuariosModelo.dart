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
  String? nombres;
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
  String? imgperfil;
  String? rol;
  String? grupo;
  String? peso;
  String? actividadsemana;
  String? nivelSemana;

  Usuario(
      {this.idUsuario,
      this.nombres,
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
      this.imgperfil,
      this.rol,
      this.grupo,
      this.peso,
      this.actividadsemana,
      this.nivelSemana});

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    idUsuario = datos['idusuario'].toString();
    nombres = datos['nombres'];
    dni = datos['dni'];
    apellidos = datos['apellidos'];
    genero = datos['genero'];
    direccion = datos['direccion'];
    dependencia = datos['dependencia'];
    fechaNacimiento = datos['fechanacimiento'];
    talla = datos['talla'].toString();
    rh = datos['rh'];
    nombreEmergencia = datos['nombreemergencia'];
    parentesco = datos['parentesco'];
    telefonoEmergencia = datos['telefonoemergencia'].toString();
    eps = datos['eps'];
    alergias = datos['alergias'];
    contrasena = datos['contrasena'];
    imgperfil = datos['imgperfil'];
    rol = datos['rol'].toString(); // Corregido
    grupo = datos['grupo']; // Corregido
    peso = datos['peso'].toString(); // Corregido
    actividadsemana = datos['actividadsemana'].toString(); // Corregido
    nivelSemana = datos['nivelSemana']; // Corregido
  }
}
