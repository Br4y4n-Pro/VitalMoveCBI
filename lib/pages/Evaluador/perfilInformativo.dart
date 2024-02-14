import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/textperfil.dart';
import 'package:fl_chart/fl_chart.dart';

class PerfilInformativo extends StatefulWidget {
  const PerfilInformativo({super.key});

  @override
  State<PerfilInformativo> createState() => _PerfilInformativoState();
}

class _PerfilInformativoState extends State<PerfilInformativo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "Ultima Información",
            style: TextStyle(
              color: Color.fromRGBO(
                  11, 35, 173, 1), // Cambia aquí el color del texto del nav
            ),
          ),
        ),
        backgroundColor: const Color(0xFFADE8F4),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  textSub("Brayan Alexis Cañas Londoño"),
                  textContent("1193238697"),
                ],
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                ),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/itachi.jpg"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(" Ultima medicion IMC"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff0096C7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              ),
              Column(
                children: [
                  Text(" Ultima medicion IMC"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xff0096C7),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                        child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: 1,
            width: 10,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 150, 199, 1),
            ),
          ),
          const SizedBox(height: 50),
          grafico(context),
          const SizedBox(height: 40),
          Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .2, size.height * .06),
                    backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .002),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {},
                child: const Text('Ver perfil completo')),
          ),
        ],
      ),
    );
  }
}

Widget grafico(context) {
  final size = MediaQuery.of(context).size;

  return Center(
    child: Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: size.width * .1),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: Colors.transparent),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 4),
                const FlSpot(1, 6),
                const FlSpot(2, 8),
                const FlSpot(3, 6.2),
                const FlSpot(4, 6),
                const FlSpot(5, 8),
                const FlSpot(6, 9),
                const FlSpot(7, 7),
                const FlSpot(8, 6),
                const FlSpot(9, 7.8),
                const FlSpot(10, 8),
              ],
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.pink,
                ],
              ),
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.2),
                    Colors.pink.withOpacity(0.2),
                  ],
                ),
              ),
              dotData: const FlDotData(show: false),
            ),
          ],
          gridData: FlGridData(
              show: true,
              drawHorizontalLine: false,
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return const FlLine(
                  color: Color.fromARGB(255, 163, 160, 160),
                  strokeWidth: 0.8,
                );
              }),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 12,
                  getTitlesWidget: (value, meta) {
                    String text = '';
                    switch (value.toInt()) {
                      case 1:
                        text = "1";
                        break;
                      case 2:
                        text = "2";
                        break;
                      case 3:
                        text = "3";
                        break;
                      case 4:
                        text = "4";
                        break;
                      case 5:
                        text = "5";
                        break;
                      case 6:
                        text = "6";
                        break;
                      case 7:
                        text = "7";
                        break;
                      case 8:
                        text = "8";
                        break;
                      case 9:
                        text = "9";
                        break;
                      case 10:
                        text = "10";
                        break;
                      default:
                        return Container();
                    }
                    return Text(
                      text,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    ),
  );
}
