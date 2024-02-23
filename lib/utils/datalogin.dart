class UserLogin {
  String? contrasena;
  String? dni;

  UserLogin({this.contrasena, this.dni});

  Map<String, dynamic> toJson() {
    return {
      "dni": dni,
      "contrasena": contrasena,
    };
  }
}
