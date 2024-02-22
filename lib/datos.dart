import 'dart:io';

class UserData {
  String? actividadSemana;
  String? alergias;
  String? apellidos;
  String? contrasena;
  String? dni;
  String? dependencia;
  String? direccion;
  String? eps;
  String? fechaNacimiento;
  String? grupo;
  String? nivelSemana;
  String? nombreEmergencia;
  String? parentesco;
  String? rh;
  String? rol;
  String? talla;
  String? telefonoEmergencia;
  String? genero;
  File? imgPerfil;
  String? nombres;

  UserData({
    this.actividadSemana,
    this.alergias,
    this.apellidos,
    this.contrasena,
    this.dni,
    this.dependencia,
    this.direccion,
    this.eps,
    this.fechaNacimiento,
    this.grupo,
    this.nivelSemana,
    this.nombreEmergencia,
    this.parentesco,
    this.rh,
    this.rol,
    this.talla,
    this.telefonoEmergencia,
    this.genero,
    this.imgPerfil,
    this.nombres,
  });

  Map<String, dynamic> toJson() {
    return {
      'actividad_semana': actividadSemana,
      'alergias': alergias,
      'apellidos': apellidos,
      'contrasena': contrasena,
      'dni': dni,
      'dependencia': dependencia,
      'direccion': direccion,
      'eps': eps,
      'fecha_nacimiento': fechaNacimiento,
      'grupo': grupo,
      'nivel_semana': nivelSemana,
      'nombre_emergencia': nombreEmergencia,
      'parentesco': parentesco,
      'rh': rh,
      'rol': rol,
      'talla': talla,
      'telefono_emergencia': telefonoEmergencia,
      'genero': genero,
      'img_perfil': imgPerfil,
      'nombres': nombres,
    };
  }
}
