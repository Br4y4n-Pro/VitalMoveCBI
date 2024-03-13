// ignore_for_file: file_names

class FechasTests {
  List<FechaTest> dato = [];
  FechasTests();

  FechasTests.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = FechaTest.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class FechaTest {
  String? fecha;
  int? testcaminatarealizado;
  int? testbrucerealizado;

  FechaTest({this.fecha, this.testcaminatarealizado, this.testbrucerealizado});

  FechaTest.fromJsonMap(Map<dynamic, dynamic> datos) {
    fecha = datos['mes'];
    testcaminatarealizado = datos['testcaminatarealizado'];
    testbrucerealizado = datos['testbrucerealizado'];
  }
}
