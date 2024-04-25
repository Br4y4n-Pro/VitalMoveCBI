// ignore_for_file: file_names

class BrucesTests {
  List<BruceTest> dato = [];
  BrucesTests();

  BrucesTests.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = BruceTest.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

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
  String? barevodos;

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
    this.barevodos,
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
    barevodos = datos['barevodos'] ?? 'N/A';
  }
}