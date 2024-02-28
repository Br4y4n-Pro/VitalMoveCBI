import 'package:dio/dio.dart';

class AllApi {
  //ferasApp.php

<<<<<<< HEAD

  static String url = 'http://192.168.56.:3050/';

=======
  static String url = 'http://10.207.80.143:3050/';

  // ignore: prefer_final_fields
>>>>>>> 9a22063db0e22314b69f7f47400becf9fda217be
  static Dio _dio = Dio();

  static void configuteDio() {
    // base del url

    _dio.options.baseUrl = url;

    // configurar headers
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      // print(path + '    ' + 'object' + resp.data);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el get');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    print(data);
    // final fromData = await FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: data);
      // print(resp.data);
      //print('object --- > ' + resp.data);
      return resp.data;
    } catch (e) {
      //print(e.toString());
      print('Error en el POST $e');
    }
  }
}
