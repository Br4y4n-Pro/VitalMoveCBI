// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/TestBruceModelo.dart';
import 'package:vitalmovecbi/provider/recomendacionTests/gets/recomendacionOneUser.dart';
import 'package:vitalmovecbi/provider/testbruce/gets/providerGetBruce.dart';
import 'package:vitalmovecbi/services/localStorage.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class PageBruces extends StatefulWidget {
  const PageBruces({super.key});
  @override
  State<PageBruces> createState() => _PageBrucesState();
}

class _PageBrucesState extends State<PageBruces> {
  int? _selectedIndex;
  int? _selectedIndexFullFechas;
  String valueSelect = '';
  bool mostrarUltimo5 = true;

  @override
  initState() {
    super.initState();
    final bruce = Provider.of<BruceGetProvider>(context, listen: false);
    bruce.bruceOneUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final bruce = Provider.of<BruceGetProvider>(context);
    final recomendacionProvider =
        Provider.of<RecomendacionGetProvider>(context);
    final listBruces = bruce.bruces;
    final longitud = listBruces.length;
    print('{la longitud es de $longitud}');
    List<BruceTest> ultimo5Bruces =
        listBruces.sublist((longitud - 5).clamp(0, longitud));
    // showModalBottomSheet  <----------Usar para mostrar abajo el modal too guapo
    List<BarChartGroupData> listBruceBar = [];

    final size = MediaQuery.of(context).size;
    for (int i = 0; i < ultimo5Bruces.length; i++) {
      final barGroupData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(
          width: 20,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          toY: double.parse(ultimo5Bruces[i]
              .numeroetapa
              .toString()), // Modified to handle null
          gradient: const LinearGradient(
            colors: [Colores.primaryColor, Colores.secondaryColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ], showingTooltipIndicators: [
        0
      ]);

      listBruceBar.add(barGroupData);
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
          text = ultimo5Bruces[0].fecha!.substring(0, 7);
          numero = 0;
          break;
        case 1:
          text = ultimo5Bruces[1].fecha!.substring(0, 7);
          numero = 1;

          break;
        case 2:
          text = ultimo5Bruces[2].fecha!.substring(0, 7);
          numero = 2;

          break;
        case 3:
          text = ultimo5Bruces[3].fecha!.substring(0, 7);
          numero = 3;

          break;
        case 4:
          text = ultimo5Bruces[4].fecha!.substring(0, 7);
          numero = 4;

          break;
        case 5:
          text = ultimo5Bruces[5].fecha!.substring(0, 7);
          numero = 5;

          break;
        case 6:
          text = ultimo5Bruces[6].fecha!.substring(0, 7);
          numero = 6;

          break;
        default:
          text = '';
          break;
      }

      try {
        if (value.toInt() >= 0 && value.toInt() < ultimo5Bruces.length) {
          text = ultimo5Bruces[value.toInt()].fecha!.substring(0, 7);
          numero = value.toInt();
        }
      } catch (e) {
        print('Error: $e');
      }
      return GestureDetector(
        onTap: () {
          // final idetapa = ultimo5Bruces[value.toInt()].idetapa!;
          setState(() {
            _selectedIndex = numero;
            _selectedIndexFullFechas = null;
            mostrarUltimo5 = true; // Cambiar a mostrar el otro listado
            // No es necesario verificar si _selectedIndex es nulo después de asignarlo
            // Manejar el caso en que usuario sea null de forma segura
            print('------------> $_selectedIndex');
            print('El numero id es $numero');
            final idTest = ultimo5Bruces[_selectedIndex!].idtest;
            if (idTest != null) {
              LocalStorage.prefs.setInt('idEtapa', idTest);
            } else {
              print('Hay error en el idEtapa es null');
            }
            recomendacionProvider.recomendacionOneUser(context);
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
          "Estadisticas de Bruce modificado",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    textSub(
                        "Historico de Test Bruce realizadas"), // Función que devuelve un widget de texto con estilo
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
                      barGroups: listBruceBar,
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
                  swapAnimationCurve: Curves.linear, // Tipo de curva de animación
                ),
              ),
              Text('')
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: listBruces.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(listBruces[index].fecha!.substring(0, 10)),
                        onTap: () {
                          setState(() {
                            print('el index es $index');
                            _selectedIndexFullFechas = index;
                            print(_selectedIndexFullFechas);
                            print(
                                'Se selecciono full fechas $_selectedIndexFullFechas');
                            print(index);
                            final idTest =
                                listBruces[_selectedIndexFullFechas!].idtest;
                            if (idTest != null) {
                              LocalStorage.prefs.setInt('idEtapa', idTest);
                            } else {
                              print('Hay error en el idEtapa es null');
                            }

                            recomendacionProvider.recomendacionOneUser(context);
                            // _selectedIndex = null;
                            mostrarUltimo5 =
                                false; // Cambiar a mostrar el otro listado
                          });
                          Navigator.pop(
                              context); // Cierra el BottomSheet al seleccionar una fecha
                        },
                      );
                    },
                  );
                },
              );
            },
            child: Text('Seleccionar Fecha'),
          ),
          SizedBox(height: 20),
          Container(
            height: size.width * .8,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 80, 79, 79).withOpacity(.3),
                    offset: Offset(6, 4),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.transparent,
                image: DecorationImage(
                    opacity: .9,
                    fit: BoxFit.cover,
                    image: AssetImage('img/General/fondoCaminata.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _selectedIndex != null && mostrarUltimo5
                    ? Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                'Estadistica de ${ultimo5Bruces[_selectedIndex!].fecha!.substring(0, 10)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range),
                                Text("  Fecha: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    ultimo5Bruces[_selectedIndex!]
                                        .fecha!
                                        .substring(0, 10),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.monitor_heart),
                                Text("  Frecuencia Cardiaca Maxima: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text('N/A',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.bar_chart, color: Colors.black),
                                Text("  Elevacion Final: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    ultimo5Bruces[_selectedIndex!].elefinal ??
                                        'N/A',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.monitor_heart_outlined),
                                Text("  Frecuencia Cardiaca en Reposo: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    // ultimo5Bruces[_selectedIndex!].fcr ??
                                    'N/A',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.directions_run, color: Colors.black),
                                Text("  Numero de etapas: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    ultimo5Bruces[_selectedIndex!]
                                        .numeroetapa
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.timelapse_sharp,
                                    color: Colors.black),
                                Text("  Saturación: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    ultimo5Bruces[_selectedIndex!]
                                            .saturacionvodos ??
                                        'N/A',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.air_sharp, color: Colors.black),
                                Text("  Consumo VO2: ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    ultimo5Bruces[_selectedIndex!]
                                        .vodos
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                      )
                    : _selectedIndexFullFechas != null && !mostrarUltimo5
                        ? Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                    'Estadistica de ${listBruces[_selectedIndexFullFechas!].fecha!.substring(0, 10)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.date_range, color: Colors.black),
                                    Text("  Fecha: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        listBruces[_selectedIndexFullFechas!]
                                            .fecha!
                                            .substring(0, 10),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.monitor_heart,
                                        color: Colors.black),
                                    Text("  Frecuencia Cardiaca Maxima: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        // listBruces[_selectedIndexFullFechas!]
                                        //         .fcm ??
                                        'N/A',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.bar_chart, color: Colors.black),
                                    Text("  Elevacion Final: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        listBruces[_selectedIndexFullFechas!]
                                            .elefinal
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.monitor_heart_outlined,
                                        color: Colors.black),
                                    Text("  Frecuencia Cardiaca en Reposo: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        // listBruces[_selectedIndexFullFechas!]
                                        //     .fcr
                                        //     .toString()
                                        'N/A',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.directions_run,
                                        color: Colors.black),
                                    Text("  Numero de etapas: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        listBruces[_selectedIndexFullFechas!]
                                            .numeroetapa
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timelapse_sharp,
                                        color: Colors.black),
                                    Text("  Saturación: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        listBruces[_selectedIndexFullFechas!]
                                                .saturacionvodos ??
                                            'N/A',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.air_sharp, color: Colors.black),
                                    Text("  Consumo VO2: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        listBruces[_selectedIndexFullFechas!]
                                            .vodos
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
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
          SizedBox(height: 20),
          !recomendacionProvider.recomendacionCargada
              ? Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: textSub(
                          'Selecciona una fecha para ver la recomendación')))
              : Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: textSub(
                        recomendacionProvider.recomendaciones[0].descripcion!),
                  )),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
