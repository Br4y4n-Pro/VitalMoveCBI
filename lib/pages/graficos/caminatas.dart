// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:unique_simple_bar_chart/data_models.dart';
// import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
// import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
// import 'package:vitalmovecbi/widgets/colores.dart';
// //import 'package:vitalmovecbi/widgets/customappbar.dart';
// import 'package:vitalmovecbi/widgets/textperfil.dart';

// class PageCaminata extends StatefulWidget {
//   const PageCaminata({Key? key}) : super(key: key);
//   @override
//   State<PageCaminata> createState() => _PageCaminataState();
// }

// class _PageCaminataState extends State<PageCaminata> {
//   @override
//   void initState() {
//     super.initState();
//     //  final caminata =
//     //       Provider.of<CaminataGetProvider>(context, listen: false);
//     //   caminata.caminataOfUser(context);
//   }

//   List<double> caminataData = [
//     5.5,
//     3.1,
//     4.3,
//     5.5,
//     4.9,
//     4.4,
//     3.8,
//     3.5,
//     3.6,
//     3.6,
//     4.5,
//     5.3
//   ];
//   String mensajeEstado =
//       "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!";

//   @override
//   Widget build(BuildContext context) {
//     final loginProvider = Provider.of<LoginProvider>(context, listen: false);
//     final usuario = loginProvider.usuarios[0];
// // showModalBottomSheet  <----------Usar para mostrar abajo el modal todo guapo




// final size = MediaQuery.of(context).size;
//     for (int i = 0; i <ultimo5fechas.length; i++) {
//       final barGroupData = BarChartGroupData(
//         x: i,
//         barRods: [
//           BarChartRodData(
//             width: 20,
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//             toY: ultimo5fechas[i].testbrucerealizado!.toDouble(),
//             gradient: const LinearGradient(
//               colors: [Colores.primaryColor, Colores.secondaryColor],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//             ),
//           ),
//           BarChartRodData(
//             width: 20,
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//             toY: ultimo5fechas[i]
//                 .testcaminatarealizado!
//                 .toDouble(), // Agrega tus nuevos datos aquí
//             gradient: const LinearGradient(
//               colors: [
//                 Colores.quaternaryColor,
//                 Colores.secondaryColor
//               ], // Colores para la segunda barra
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//             ),
//           ),
//         ],
//         showingTooltipIndicators: [
//           0,
//           1
//         ], // Indicar que hay dos barras para mostrar tooltips
//       );

//       ultimo5fechasbar.add(barGroupData);
//     }

//     Widget getTitles(double value, TitleMeta meta) {
//       const style = TextStyle(
//         color: Colores.primaryColor,
//         fontWeight: FontWeight.bold,
//         fontSize: 14,
//       );
//       String text;
//       switch (value.toInt()) {
//         case 0:
//           text = '${ultimo5fechas[0].fecha}';
//           break;
//         case 1:
//           text = '${ultimo5fechas[1].fecha}';
//           break;
//         case 2:
//           text = '${ultimo5fechas[2].fecha}';
//           break;
//         case 3:
//           text = '${ultimo5fechas[3].fecha}';
//           break;
//         case 4:
//           text = '${ultimo5fechas[4].fecha}';
//           break;
//         case 5:
//           text = '${ultimo5fechas[5].fecha}';
//           break;
//         default:
//           text = '';
//           break;
//       }
//       return SideTitleWidget(
//         axisSide: meta.axisSide,
//         space: 4,
//         child: Text(text, style: style),
//       );
//     }



    
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colores.quaternaryColor),
//         title: const Text(
//           "Estadisticas de Caminata",
//           style: TextStyle(
//               color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
//         ),
//         backgroundColor: Colores.primaryColor,
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Column(
//                   children: [
//                     textSub(
//                         "Mi record de Enero a Diciembre"), // Función que devuelve un widget de texto con estilo
//                     // Función que devuelve un widget de texto con estilo
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                     height: 200,
//                     child: BarChart(
//                       BarChartData(
//                         titlesData: FlTitlesData(
//                           show: true,
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               reservedSize: 30,
//                               getTitlesWidget: getTitles,
//                             ),
//                           ),
//                           leftTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               getTitlesWidget: (double value, TitleMeta meta) {
//                                 // Personaliza aquí los títulos del eje Y
//                                 final String text =
//                                     value == 0 ? '0' : '${value.toInt()}';
//                                 return Text(text,
//                                     style: const TextStyle(
//                                         color: Colors.black, fontSize: 10));
//                               },
//                               reservedSize: 28,
//                               interval:
//                                   1, // Define el intervalo de los valores en el eje Y
//                             ),
//                           ),
//                           topTitles: const AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                           rightTitles: const AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                         ),
//                         barGroups: ultimo5fechasbar,
//                         gridData: const FlGridData(show: false),
//                         alignment: BarChartAlignment.spaceAround,
//                         maxY:
//                             2, // Asegúrate de ajustar este valor al máximo valor que esperas en el eje Y
//                         borderData: FlBorderData(
//                           show: true,
//                           border: const Border(
//                             bottom: BorderSide(color: Colors.black, width: 1),
//                             left: BorderSide(color: Colors.black, width: 1),
//                           ),
//                         ),
//                         barTouchData: BarTouchData(
//                           enabled: false,
//                           touchTooltipData: BarTouchTooltipData(
//                             tooltipBgColor: Colors.transparent,
//                             tooltipPadding: EdgeInsets.zero,
//                             tooltipMargin: 8,
//                             getTooltipItem: (
//                               BarChartGroupData group,
//                               int groupIndex,
//                               BarChartRodData rod,
//                               int rodIndex,
//                             ) {
//                               return BarTooltipItem(
//                                 rod.toY.round().toString(),
//                                 const TextStyle(
//                                   color: Colores.tertiaryColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       swapAnimationDuration: const Duration(
//                           milliseconds: 500), // Duración de la animación
//                       swapAnimationCurve:
//                           Curves.ease, // Tipo de curva de animación
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
//           Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Mi estado actual',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     '5.5 kilometros',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Text(
//                       "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getMonthName(int month) {
//     switch (month) {
//       case 1:
//         return 'Ene';
//       case 2:
//         return 'Feb';
//       case 3:
//         return 'Mar';
//       case 4:
//         return 'Abr';
//       case 5:
//         return 'May';
//       case 6:
//         return 'Jun';
//       case 7:
//         return 'Jul';
//       case 8:
//         return 'Ago';
//       case 9:
//         return 'Sep';
//       case 10:
//         return 'Oct';
//       case 11:
//         return 'Nov';
//       case 12:
//         return 'Dic';
//       default:
//         return '';
//     }
//   }
// }
