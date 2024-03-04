import 'package:flutter/material.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class ConsumoVo extends StatefulWidget {
  const ConsumoVo({Key? key}) : super(key: key);

  @override
  State<ConsumoVo> createState() => _ConsumoVoState();
}

class _ConsumoVoState extends State<ConsumoVo> {
  // Valores de ConsumoVO2
  List<double> consumoVoData = [
    41.5,
    36.1,
    42.3,
    41.5,
    40.9,
    34.4,
    37.8,
    40.5,
    40.6,
    41.6,
    39.5,
    47.3
  ];

  String mensajeEstado =
      "Felicidades, ¡has alcanzado un estado óptimo en tu consumo de oxígeno (VO2)! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una excelente eficiencia en el uso de oxígeno durante el ejercicio. Esto es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
          title: const Text(
            "Estadisticas del ConsumoVO2",
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
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Mi estado actual',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Normal:41.5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                      "Felicidades, ¡has alcanzado un estado óptimo en tu consumo de oxígeno (VO2)! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una excelente eficiencia en el uso de oxígeno durante el ejercicio. Esto es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SimpleBarChart(
                      listOfHorizontalBarData:
                          consumoVoData.asMap().entries.map((entry) {
                        final index = entry.key;
                        final peso = entry.value;
                        return HorizontalDetailsModel(
                          name: _getMonthName(index + 1), // Mes
                          color: Color.fromARGB(255, 6, 158, 223),
                          size: peso, // Valor de ConsumoVO2
                        );
                      }).toList(),
                      verticalInterval: 20, // Intervalo de ConsumoVO2
                      horizontalBarPadding: 3, // Espaciado entre barras
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Mi estado actual',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Normal:41.5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                        "Felicidades, ¡has alcanzado un estado óptimo en tu consumo de oxígeno (VO2)! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una excelente eficiencia en el uso de oxígeno durante el ejercicio. Esto es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!"),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottombar(context, 3),
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
