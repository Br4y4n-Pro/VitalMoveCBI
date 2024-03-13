import 'package:flutter/material.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import '../../Api/AllApi.dart';
import '../../Modelos/TestBruceModelo.dart';

class BruceProvider extends ChangeNotifier {
  List<BruceTest> brucetests = [];

  bruce(BruceFromProvider fromProvider, BuildContext context) {
    final data = {
      "etapas": fromProvider.etapa,
      "saturacionvodos": fromProvider.saturacion
    };
    print(data);

    AllApi.httpPost('crearTestBruce', data).then((rpta) {
      print("ESperando");
      print(rpta.runtimeType);

      final Map<String, dynamic> jsonResponse = rpta;
      if (jsonResponse["rp"] == "si") {
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                      weight: 40,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${jsonResponse['mensaje']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )));
      } else {
        // ischeck = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 40,
            content: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                      weight: 40,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${jsonResponse['mensaje']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )));
        // print('${jsonResponse['mensaje']}');
      }
      print(jsonResponse);
    });
  }
}
