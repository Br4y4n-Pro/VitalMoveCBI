import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PagePeso extends StatefulWidget {
  const PagePeso({super.key});

  @override
  State<PagePeso> createState() => _PagePesoState();
}

class _PagePesoState extends State<PagePeso> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Estadisticas del Peso")),
        body: Center(
          child: Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 10,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                    dotData: FlDotData(show: false),
                  ),
                ],
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: false,
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Color.fromARGB(255, 163, 160, 160),
                        strokeWidth: 0.8,
                      );
                    }),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
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
        ),
      ),
    );
  }
}
