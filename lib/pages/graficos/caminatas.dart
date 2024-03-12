import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
//import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class PageCaminata extends StatefulWidget {
  const PageCaminata({Key? key}) : super(key: key);
  @override
  State<PageCaminata> createState() => _PageCaminataState();
}

class _PageCaminataState extends State<PageCaminata> {
@override
void initState() {
  super.initState();
  //  final caminata =
  //       Provider.of<CaminataGetProvider>(context, listen: false);
  //   caminata.caminataOfUser(context);
  
}
  List<double> caminataData = [
    5.5,
    3.1,
    4.3,
    5.5,
    4.9,
    4.4,
    3.8,
    3.5,
    3.6,
    3.6,
    4.5,
    5.3
  ];
  String mensajeEstado =
      "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!";

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];

    return SafeArea(
      child: Scaffold(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          textSub('${usuario.nombres} ${usuario.apellidos}'),
                          textContent("${usuario.dni}"),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage: (usuario.imgperfil != null)
                                ? NetworkImage(usuario.imgperfil.toString())
                                : const AssetImage("img/Usuario/usu2.png")
                                    as ImageProvider<Object>),
                      ),
                    ],
                  ),
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
                                        fontSize: 16),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '5.5 kilometros',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                      "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SimpleBarChart(
                      listOfHorizontalBarData:
                          caminataData.asMap().entries.map((entry) {
                        final index = entry.key;
                        final distancia =
                            entry.value; // Cambio de nombre a 'distancia'
                        return HorizontalDetailsModel(
                          name: _getMonthName(index + 1),
                          color: Color.fromARGB(255, 6, 158, 223),
                          size: distancia, // Cambio del nombre de la variable
                        );
                      }).toList(),
                      verticalInterval:
                          5, // Cambiando el intervalo vertical para representar la distancia en kilómetros
                      horizontalBarPadding: 3,
                      // verticalTextMapper: (value) => '$value km', // Cambio del texto en el eje vertical
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Card(
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
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                        "Felicidades, ¡has alcanzado un estado óptimo en tu rendimiento durante la caminata! Según las estadísticas del mes, tu capacidad cardiovascular está en un nivel excelente, lo que indica una salud cardiovascular sólida y una eficiencia destacada al caminar. Este logro es fundamental para mantener una vida activa y prevenir enfermedades relacionadas con el corazón. ¡Sigue así y continúa con tus hábitos saludables para mantener tu bienestar cardiovascular a largo plazo!"),
                  ),
                ],
              ),
            ),
          ],
        ),
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
