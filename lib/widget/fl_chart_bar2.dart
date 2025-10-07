import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => _BarChartSample2State();
}

class _BarChartSample2State extends State<BarChartSample2> {
  final double width = 14;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  // 🎨 Warna tema hitam-putih minimalis
  final Color masukBarColor = const Color(0xFF1A1A1A);
  final Color sakitBarColor = const Color(0xFF333333);
  final Color izinBarColor = const Color(0xFF4D4D4D);
  final Color alphaBarColor = const Color(0xFF808080);

  final Color avgColor = const Color(
    0xFFBDBDBD,
  ); // warna rata-rata (abu sedang)

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, 2, 1);
    final barGroup2 = makeGroupData(1, 16, 12, 3, 0);
    final barGroup3 = makeGroupData(2, 18, 5, 1, 2);
    final barGroup4 = makeGroupData(3, 20, 16, 4, 1);
    final barGroup5 = makeGroupData(4, 17, 6, 8, 3);
    final barGroup6 = makeGroupData(5, 19, 1.5, 1, 1);

    rawBarGroups = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
    ];
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Grafik Kehadiran',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipRoundedRadius: 8,
                      getTooltipColor: (group) => Colors.grey.shade200,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.toString(),
                          TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: MediaQuery.sizeOf(context).width < 800
                                ? 10
                                : 14,
                          ),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg =
                              sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                      return rod.copyWith(
                                        toY: avg,
                                        color: avgColor,
                                      );
                                    })
                                    .toList(),
                              );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 5,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      decoration: TextDecoration.none,
    );
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text('${value.toInt()}', style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        decoration: TextDecoration.none,
      ),
    );

    return SideTitleWidget(meta: meta, space: 12, child: text);
  }

  BarChartGroupData makeGroupData(
    int x,
    double masuk,
    double sakit,
    double izin,
    double alpha,
  ) {
    return BarChartGroupData(
      barsSpace: 6,
      x: x,
      barRods: [
        BarChartRodData(
          toY: masuk,
          color: masukBarColor,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: sakit,
          color: sakitBarColor,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: izin,
          color: izinBarColor,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: alpha,
          color: alphaBarColor,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
