// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:vitalmovecbi/utils/datalogin.dart';

Future<void> enviarDatos(UserLogin userLogin) async {
  Dio dio = Dio();

  try {
    // ipconfig se usa en cmd para ver Dirección IPv4 el 3050 es el puerto que se puso en el backend
    String url = 'http://10.207.65.61:3050/login';
    Map<String, dynamic> jsonData = userLogin.toJson();
    print(jsonData);

    Response response = await dio.post(url, data: jsonData);
    print(response);
    if (response.statusCode == 200) {
      print('Solicitud exitosa');
      print(response.data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
