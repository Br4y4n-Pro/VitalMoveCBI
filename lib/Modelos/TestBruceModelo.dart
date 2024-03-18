class BruceTest {
  dynamic fecha;
  dynamic elefinal;
  dynamic velocidadfinal;
  int? numeroetapa; // Cambiado a int
  dynamic fcr;
  dynamic fcm;
  double? vodos; // Cambiado a double
  dynamic tiempo;
  dynamic saturacionvodos;
  int? idusuario;

  BruceTest({
    this.fecha,
    this.elefinal,
    this.velocidadfinal,
    this.numeroetapa,
    this.fcr,
    this.fcm,
    this.vodos,
    this.tiempo,
    this.saturacionvodos,
    this.idusuario,
  });

  BruceTest.fromJsonMap(Map<String, dynamic> datos) {
    fecha = datos['fecha'].toString();
    elefinal = datos['elefinal'].toString();
    velocidadfinal = datos['velocidadfinal'].toString();
    numeroetapa = datos['numeroetapa']; // Convertir a String
    fcr = datos['fcr'] != null ? datos['fcr'].toString() : null;
    fcm = datos['fcm'] != null ? datos['fcm'].toString() : null;
    vodos = datos['vodos'] != null
        ? double.tryParse(datos['vodos'].toString())
        : null;
    tiempo = datos['tiempo'].toString();
    saturacionvodos = datos['saturacionvodos'] != null
        ? datos['saturacionvodos'].toString()
        : null;
    idusuario = datos['idusuario'];
  }
}
