// ignore_for_file: file_names, unused_import

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:vitalmovecbi/Modelos/fechasTestsModelo.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/provider/datosGenerales/fechaTestsProvider.dart';
import 'package:vitalmovecbi/provider/datosGenerales/historialUser.dart';
import 'package:vitalmovecbi/provider/datosGenerales/notasDiariasProvider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    final historialProvider =
        Provider.of<HistorialProvider>(context, listen: false);
    historialProvider.historialOnePerson(context);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final providerFecha = Provider.of<FechaTestProvider>(context);
    final providerNota = Provider.of<NotasDiariasProvider>(context);
    final providerHistorial = Provider.of<HistorialProvider>(context);
    final usuario = loginProvider.usuarios[0];
    final fechas = providerFecha.fechas;
    int longitud = fechas.length;
    List<FechaTest> ultimo5fechas =
        fechas.sublist((longitud - 5).clamp(0, longitud));
    List<BarChartGroupData> ultimo5fechasbar = [];
    final nota = providerNota.notas;
    final ultimoHistorial = providerHistorial.historiales;
    // List<Caminata> restoLista =
    //     caminatas.sublist(0, (longitud - 5).clamp(0, longitud));
    // final List<BarChartGroupData> barGroups = [];
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < ultimo5fechas.length; i++) {
      final barGroupData = BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            width: 20,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            toY: ultimo5fechas[i].testbrucerealizado!.toDouble(),
            gradient: const LinearGradient(
              colors: [Colores.primaryColor, Colores.secondaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          BarChartRodData(
            width: 20,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            toY: ultimo5fechas[i]
                .testcaminatarealizado!
                .toDouble(), // Agrega tus nuevos datos aquí
            gradient: const LinearGradient(
              colors: [
                Colores.quaternaryColor,
                Colores.secondaryColor
              ], // Colores para la segunda barra
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
        showingTooltipIndicators: [
          0,
          1
        ], // Indicar que hay dos barras para mostrar tooltips
      );

      ultimo5fechasbar.add(barGroupData);
    }

    Widget getTitles(double value, TitleMeta meta) {
      const style = TextStyle(
        color: Colores.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      String text;
      switch (value.toInt()) {
        case 0:
          text = '${ultimo5fechas[0].fecha}';
          break;
        case 1:
          text = '${ultimo5fechas[1].fecha}';
          break;
        case 2:
          text = '${ultimo5fechas[2].fecha}';
          break;
        case 3:
          text = '${ultimo5fechas[3].fecha}';
          break;
        case 4:
          text = '${ultimo5fechas[4].fecha}';
          break;
        case 5:
          text = '${ultimo5fechas[5].fecha}';
          break;
        default:
          text = '';
          break;
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text(text, style: style),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    "img/Logo.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xff0096C7),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/configuracion");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'No puedes volver atrás en esta pantalla',
            ),
          ));
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                '${usuario.nombres} ${usuario.apellidos}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('CC ${usuario.dni}'),
              leading: CircleAvatar(
                  backgroundImage: (usuario.imgperfil != null)
                      ? NetworkImage(usuario.imgperfil.toString())
                      : const AssetImage("img/Usuario/usu2.png")
                          as ImageProvider<Object>),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(" Baremacion IMC"),
                    const SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: size.width * .25,
                      decoration: const BoxDecoration(
                          color: Color(0xff0096C7),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: !providerHistorial.historialCargado
                              ? const CircularProgressIndicator()
                              : ultimoHistorial.isNotEmpty
                                  ? Text(
                                      '${ultimoHistorial[0].imcdescripcion}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : const Center(child: Text('No hay data'))),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text(" Ultima medicion IMC"),
                    const SizedBox(height: 10),
                    Container(
                        width: size.width * .25,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color(0xff0096C7),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: providerHistorial.historialCargado
                              ? ultimoHistorial.isNotEmpty
                                  ? Text(
                                      ultimoHistorial.isNotEmpty
                                          ? double.parse(
                                                  ultimoHistorial[0].imc ?? '0')
                                              .toStringAsFixed(2)
                                          : '0.00',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : const Center(child: Text('No hay data'))
                              : const CircularProgressIndicator(),
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 1,
              width: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 150, 199, 1),
              ),
            ),
            const SizedBox(height: 20),
            textSub('Tests realizados los ultimos meses'),
            const SizedBox(height: 20),
            (fechas.isEmpty)
                ? const Center(
                    heightFactor: 6,
                    child: Text('No se ha registrado ningún test'))
                : SizedBox(
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
                                  1, // Define el intervalo de los valores en el eje Y
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        barGroups: ultimo5fechasbar,
                        gridData: const FlGridData(show: false),
                        alignment: BarChartAlignment.spaceAround,
                        maxY:
                            2, // Asegúrate de ajustar este valor al máximo valor que esperas en el eje Y
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                            left: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: EdgeInsets.zero,
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
                                  color: Colores.tertiaryColor,
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
            fechas.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Colores.quaternaryColor,
                                Colores.secondaryColor
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text(
                              'Caminatas',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Colores.primaryColor,
                                Colores.secondaryColor
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text(
                              'Bruce',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notas Diarias 💡',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    providerNota.notaCargada
                        ? Text(
                            '${nota[0].descripcion}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          'Peso saludable',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Peso saludable Si le es difícil controlar su peso, ciertamente no está solo en el mundo actual. De hecho, más del 39 por ciento de los adultos en los Estados Unidos tienen obesidad.1 El exceso de peso puede causar enfermedades del corazón, diabetes tipo 2, enfermedad renal y otros problemas de salud crónicos. Establecer metas para mejorar su salud puede ayudarle a reducir la probabilidad de desarrollar problemas de salud relacionados con el peso.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 48, 48, 48),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 200,
                          height: 180, // Ancho deseado de la imagen
                          child: Container(
                            margin: const EdgeInsets.all(9.0),
                            child: Image.asset(
                              "img/caminar.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
