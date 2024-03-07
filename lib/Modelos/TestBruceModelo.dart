// ignore_for_file: file_names

class BruceTests {
  List<BruceTest> dato = [];
  BruceTests();

  BruceTests.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = BruceTest.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class BruceTest {
  String? idetapa;
  String? elefinal;
  String? velocidadfinal;
  String? numeroetapa;
  String? fcr;
  String? fcm;
  String? vodos;
  String? idtestbruce;
  String? saturacionvodos;

  BruceTest({
    this.idetapa,
    this.elefinal,
    this.velocidadfinal,
    this.numeroetapa,
    this.fcr,
    this.fcm,
    this.vodos,
    this.idtestbruce,
    this.saturacionvodos,
  });

  BruceTest.fromJsonMap(Map<String, dynamic> datos) {
    idetapa = datos['idetapa'].toString();
    elefinal = datos['elefinal'];
    velocidadfinal = datos['velocidadfinal'].toString();
    numeroetapa = datos['numeroetapa'];
    fcr = datos['fcr'];
    fcm = datos['fcm'];
    vodos = datos['vodos'];
    idtestbruce = datos['idtestbruce'];
    saturacionvodos = datos['saturacionvodos'].toString();
  }
}
