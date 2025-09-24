import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controllers/qaza_controller.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final QazaController controller = Get.find<QazaController>();

  bool showPieChart = false; // 👈 toggle between bar/pie

  // helper function to format large numbers (e.g., 10000 -> 10k)
  String formatNumber(int value) {
    if (value >= 1000000) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    } else if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}k";
    } else {
      return value.toString();
    }
  }

  // 🎨 gradients for each prayer (used in both bar & pie)
  final List<List<Color>> gradients = [
    [Colors.blueAccent, Colors.blue],
    [Colors.purpleAccent, Colors.deepPurple],
    [Colors.orangeAccent, Colors.deepOrange],
    [Colors.greenAccent, Colors.green],
    [Colors.pinkAccent, Colors.pink],
    [Colors.tealAccent, Colors.teal],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qaza Namaz Stats")),
      body: Obx(() {
        final prayers = controller.prayers;
        final counters = controller.counters;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🔘 Toggle Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bar Chart"),
                  Switch(
                    value: showPieChart,
                    onChanged: (value) {
                      setState(() {
                        showPieChart = value;
                      });
                    },
                  ),
                  const Text("Pie Chart"),
                ],
              ),
              const SizedBox(height: 20),

              // 📊 Chart Section
              Expanded(
                child: showPieChart
                    ? PieChart(
                  PieChartData(
                    sections: List.generate(prayers.length, (index) {
                      final count = counters[prayers[index]] ?? 0;
                      final gradientColors =
                      gradients[index % gradients.length];

                      return PieChartSectionData(
                        value: count.toDouble(),
                        title: "${prayers[index]}\n$count",
                        radius: 80,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        // 👇 apply gradient
                        gradient: LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      );
                    }),
                  ),
                )
                    : BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60, // 🔥 More space for large numbers
                          getTitlesWidget: (value, meta) {
                            return Text(
                              formatNumber(value.toInt()),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
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
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= prayers.length) {
                              return const SizedBox();
                            }
                            return Text(
                              prayers[index],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: List.generate(prayers.length, (index) {
                      final count = counters[prayers[index]] ?? 0;
                      final gradientColors =
                      gradients[index % gradients.length];
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: count.toDouble(),
                            gradient: LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            width: 20,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔢 Total Qaza Count
              Text(
                "Total Qaza: ${counters.values.fold<int>(0, (a, b) => a + b)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }
}
