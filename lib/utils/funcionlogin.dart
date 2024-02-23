// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:vitalmovecbi/utils/datalogin.dart';

Future<void> enviarDatos(UserLogin userLogin) async {
  Dio dio = Dio();

  try {
    String url = 'http://192.168.1.41:3050/login';
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
