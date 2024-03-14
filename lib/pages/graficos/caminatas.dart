// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/CaminataModelo.dart';
import 'package:vitalmovecbi/provider/caminata/gets/providerGetCaminata.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class PageCaminata extends StatefulWidget {
  const PageCaminata({super.key});
  @override
  State<PageCaminata> createState() => _PageCaminataState();
}

class _PageCaminataState extends State<PageCaminata> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    final caminata = Provider.of<CaminataGetProvider>(context, listen: false);
    caminata.caminataOfUser(context);
  }

  String mensajeEstado =
      "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!";

  @override
  Widget build(BuildContext context) {
    print(_selectedIndex);
    final caminata = Provider.of<CaminataGetProvider>(context);
    final listCaminatas = caminata.caminatas;
    final longitud = listCaminatas.length;
    List<Caminata> ultimo5caminatas =
        listCaminatas.sublist((longitud - 5).clamp(0, longitud));

// showModalBottomSheet  <----------Usar para mostrar abajo el modal too guapo
    List<BarChartGroupData> listCaminataBar = [];

    // final size = MediaQuery.of(context).size;
    for (int i = 0; i < ultimo5caminatas.length; i++) {
      final barGroupData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(
          width: 20,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          toY: double.parse(ultimo5caminatas[i].fcm!),
          gradient: const LinearGradient(
            colors: [Colores.primaryColor, Colores.secondaryColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ], showingTooltipIndicators: [
        0
      ]);

      listCaminataBar.add(barGroupData);
    }

    Widget getTitles(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colores.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      String text;
      int? numero;

      switch (value.toInt()) {
        case 0:
          text = ultimo5caminatas[0].fecha!.substring(0, 7);
          numero = 0;
          break;
        case 1:
          text = ultimo5caminatas[1].fecha!.substring(0, 7);
          numero = 1;

          break;
        case 2:
          text = ultimo5caminatas[2].fecha!.substring(0, 7);
          numero = 2;

          break;
        case 3:
          text = ultimo5caminatas[3].fecha!.substring(0, 7);
          numero = 3;

          break;
        case 4:
          text = ultimo5caminatas[4].fecha!.substring(0, 7);
          numero = 4;

          break;
        case 5:
          text = ultimo5caminatas[5].fecha!.substring(0, 7);
          numero = 5;

          break;
        case 6:
          text = ultimo5caminatas[6].fecha!.substring(0, 7);
          numero = 6;

          break;
        default:
          text = '';
          break;
      }
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = numero;
          });
        },
        child: SideTitleWidget(
          axisSide: meta.axisSide,
          space: 4,
          child: Text(text, style: style),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          "Estadisticas de Caminata",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    textSub(
                        "Mi record de Enero a Diciembre"), // Función que devuelve un widget de texto con estilo
                    // Función que devuelve un widget de texto con estilo
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: getTitles,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              // Personaliza aquí los títulos del eje Y
                              final String text =
                                  value == 0 ? '0' : '${value.toInt()}';
                              return Text(text,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10));
                            },
                            reservedSize: 28,
                            interval:
                                20, // Define el intervalo de los valores en el eje Y
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      barGroups: listCaminataBar,
                      gridData: const FlGridData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                      maxY:
                          200, // Asegúrate de ajustar este valor al máximo valor que esperas en el eje Y
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                          left: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),

                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.black,
                          tooltipPadding: const EdgeInsets.all(8),
                          tooltipMargin: 8,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            return BarTooltipItem(
                              rod.toY.round().toString(),
                              const TextStyle(
                                color: Colores.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    swapAnimationDuration: const Duration(
                        milliseconds: 500), // Duración de la animación
                    swapAnimationCurve:
                        Curves.ease, // Tipo de curva de animación
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
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
                      '5.5 kilometros',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  _selectedIndex != null
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                  "Fecha: ${ultimo5caminatas[_selectedIndex!].fecha}"),
                              Text(
                                  "FCM: ${ultimo5caminatas[_selectedIndex!].fcm}"),
                              // Agrega aquí más información que quieras mostrar
                            ],
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Selecciona una fecha para ver los detalles"),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
