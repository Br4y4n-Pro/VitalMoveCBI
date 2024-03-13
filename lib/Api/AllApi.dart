// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';

class AllApi {
  // static String url = 'http://10.207.80.142:3050/';
 // static String url = 'http://192.168.16.28:3050/';
   static String url = 'https://backend-vitalmove.onrender.com/';

  static final Dio _dio = Dio();

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

  static Future httpPost(String path, data) async {
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
