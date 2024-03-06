import 'package:flutter/material.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
//import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class PagePeso extends StatefulWidget {
  const PagePeso({super.key});

  @override
  State<PagePeso> createState() => _PagePesoState();
}

class _PagePesoState extends State<PagePeso> {
  List<double> pesoData = [
    22.5,
    20.1,
    22.3,
    25.5,
    24.9,
    24.4,
    23.8,
    23.5,
    23.6,
    23.6,
    21.5,
    25.3
  ];
  String mensajeEstado =
      "Felicidades, ¡has alcanzado un estado óptimo de salud! Según las estadísticas del mes, tu índice de masa corporal (IMC) se encuentra dentro del rango saludable, lo que indica que estás manteniendo un peso adecuado para tu altura. Mantener un peso saludable es fundamental para prevenir enfermedades crónicas y promover una vida plena y activa. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar a largo plazo!";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
          title: const Text(
            "Estadisticas del Peso",
            style: TextStyle(
                color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colores.primaryColor,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    child: Column(
                      children: [
                        textSub(
                            "Mi record de Enero a Diciembre"), // Función que devuelve un widget de texto con estilo
                        // Función que devuelve un widget de texto con estilo
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      // Aquí puedes mostrar una tarjeta de información (card) al seleccionar una barra
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Mi estado actual',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),

                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Normal: 22.5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Felicidades, ¡has alcanzado un estado óptimo de salud! Según las estadísticas del mes, tu índice de masa corporal (IMC) se encuentra dentro del rango saludable, lo que indica que estás manteniendo un peso adecuado para tu altura. Mantener un peso saludable es fundamental para prevenir enfermedades crónicas y promover una vida plena y activa. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar a largo plazo!",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SimpleBarChart(
                      listOfHorizontalBarData:
                          pesoData.asMap().entries.map((entry) {
                        final index = entry.key;
                        final peso = entry.value;
                        return HorizontalDetailsModel(
                          name: _getMonthName(index +
                              1), // Assuming index 0 corresponds to January
                          color: const Color.fromARGB(255, 6, 158, 223),
                          size: peso, // Peso en kilogramos
                        );
                      }).toList(),
                      verticalInterval:
                          18, // Intervalo de 50 kg entre cada número
                      horizontalBarPadding:
                          3, // Reducción de la distancia entre las barras
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Mi estado actual',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Normal: 22.5',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Felicidades, ¡has alcanzado un estado óptimo de salud! Según las estadísticas del mes, tu índice de masa corporal (IMC) se encuentra dentro del rango saludable, lo que indica que estás manteniendo un peso adecuado para tu altura. Mantener un peso saludable es fundamental para prevenir enfermedades crónicas y promover una vida plena y activa. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar a largo plazo!",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //bottomNavigationBar: bottombar(context, 3),
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Ene';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dic';
      default:
        return '';
    }
  }
}
