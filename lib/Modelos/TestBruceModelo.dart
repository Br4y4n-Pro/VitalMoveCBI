// ignore_for_file: file_names

class BruceTest {
  dynamic fecha;
  dynamic elefinal;
  dynamic velocidadfinal;
  int? numeroetapa;
  // dynamic fcr;
  // dynamic fcm;
  dynamic vodos;
  dynamic tiempo;
  dynamic saturacionvodos;
  int? idusuario;
  int? idetapa;
  int? idtest;

  BruceTest({
    this.idetapa,
    this.fecha,
    this.elefinal,
    this.velocidadfinal,
    this.numeroetapa,
    // this.fcr,
    // this.fcm,
    this.vodos,
    this.tiempo,
    this.saturacionvodos,
    this.idusuario,
    this.idtest,
  });

  BruceTest.fromJsonMap(Map<String, dynamic> datos) {
    fecha = datos['fecha']?.toString() ?? 'N/A'.toString();
    elefinal = datos['elefinal']?.toString() ?? 'N/A'.toString();
    velocidadfinal = datos['velocidadfinal']?.toString() ?? 'N/A'.toString();
    numeroetapa = datos['numeroetapa'] as int?;
    // fcr = datos['fcr']?.toString() ?? 'N/A'.toString();
    // fcm = datos['fcm']?.toString() ?? 'N/A'.toString();
    vodos = datos['vodos'] != null
        ? double.tryParse(datos['vodos'].toString())
        : null;
    vodos ??= 0.0;
    tiempo = datos['tiempo']?.toString() ?? 'N/A'.toString();
    saturacionvodos = datos['saturacionvodos']?.toString() ?? 'N/A'.toString();
    idusuario = datos['idusuario'] as int?;
    idetapa = datos['idetapa'] as int?;
    idtest = datos['idtest'] as int?;
  }
}
