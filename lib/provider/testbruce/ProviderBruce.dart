import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import '../../Api/AllApi.dart';
import '../../Modelos/TestBruceModelo.dart';

class BruceProvider extends ChangeNotifier {
  List<BruceTest> brucetests = [];
  

  bruce(BruceFromProvider fromProvider, BuildContext context) {
    final data = {
      "etapa": fromProvider.etapa,
      "saturacion": fromProvider.saturacion
    };
    print(data);

    AllApi.httpPost('brucetest', data).then((rpta) {
      print("ESperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      print(jsonResponse);
      
    });
  }
}
