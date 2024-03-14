import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
//import 'package:vitalmovecbi/widgets/customappbar.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';

class PageBruces extends StatefulWidget {
  const PageBruces({super.key});

  @override
  State<PageBruces> createState() => _PageBrucesState();
}

class _PageBrucesState extends State<PageBruces> {
  List<double> bruceData = [
    19.5,
    15.1,
    10.3,
    16.5,
    16.9,
    14.4,
    18.8,
    19.5,
    17.6,
    19.6,
    18.5,
    16.3
  ];
  String mensajeEstado =
      "Felicidades,¡has demostrado un rendimiento excepcional en el Test de Bruce! Tus resultados reflejan una excelente capacidad cardiovascular y una gran resistencia física. Este logro es testimonio de tu dedicación al entrenamiento y tu compromiso con un estilo de vida saludable. Sigue así, ¡tu determinación es inspiradora! Que este éxito te motive a seguir desafiándote y alcanzando nuevas metas en tu camino hacia la salud y el bienestar.";

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colores.quaternaryColor),
          title: const Text(
            "Estadisticas del Test de Bruce",
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
                  Column(
                    children: [
                      textSub(
                          "Mi record de Enero a Diciembre"), // Función que devuelve un widget de texto con estilo
                      // Función que devuelve un widget de texto con estilo
                    ],
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
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                      "Felicidades,¡has demostrado un rendimiento excepcional en el Test de Bruce! Tus resultados reflejan una excelente capacidad cardiovascular y una gran resistencia física. Este logro es testimonio de tu dedicación al entrenamiento y tu compromiso con un estilo de vida saludable. Sigue así, ¡tu determinación es inspiradora! Que este éxito te motive a seguir desafiándote y alcanzando nuevas metas en tu camino hacia la salud y el bienestar."),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SimpleBarChart(
                      listOfHorizontalBarData:
                          bruceData.asMap().entries.map((entry) {
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
                          10, // Intervalo de 50 kg entre cada número
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '19.5 Met',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Felicidades,¡has demostrado un rendimiento excepcional en el Test de Bruce! Tus resultados reflejan una excelente capacidad cardiovascular y una gran resistencia física. Este logro es testimonio de tu dedicación al entrenamiento y tu compromiso con un estilo de vida saludable. Sigue así, ¡tu determinación es inspiradora! Que este éxito te motive a seguir desafiándote y alcanzando nuevas metas en tu camino hacia la salud y el bienestar.",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        ///bottomNavigationBar: bottombar(context, 3),
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
