import 'package:admin_abzenzee/widget/legend_widget_juga.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartSample6 extends StatelessWidget {
  const BarChartSample6({super.key});

  final double betweenSpace = 0.2;

  // 🎨 Warna disesuaikan agar senada dengan palet modern biru-cyan-ungu
  Color get pilateColor => const Color(0xFF7C4DFF); // Purple Accent
  Color get quickWorkoutColor => const Color(0xFF00BCD4); // Cyan
  Color get cyclingColor => const Color(0xFF448AFF); // Blue Accent

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
    double barWidth,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: barWidth,
          borderRadius: BorderRadius.circular(3),
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: barWidth,
          borderRadius: BorderRadius.circular(3),
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: cyclingColor,
          width: barWidth,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 11, fontWeight: FontWeight.w600);
    String text = switch (value.toInt()) {
      0 => 'JAN',
      1 => 'FEB',
      2 => 'MAR',
      3 => 'APR',
      4 => 'MAY',
      5 => 'JUN',
      6 => 'JUL',
      7 => 'AUG',
      8 => 'SEP',
      9 => 'OCT',
      10 => 'NOV',
      11 => 'DEC',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      space: 6,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final barWidth = screenWidth < 600
        ? 4.0
        : screenWidth < 900
            ? 6.0
            : 8.0;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity Overview',
            style: TextStyle(
              color: cyclingColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LegendsListWidget(
            legends: [
              Legend('Pilates', pilateColor),
              Legend('Quick Workouts', quickWorkoutColor),
              Legend('Cycling', cyclingColor),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 22,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade300,
                    strokeWidth: 0.8,
                  ),
                ),
                barGroups: [
                  generateGroupData(0, 2, 3, 2, barWidth),
                  generateGroupData(1, 2, 5, 1.7, barWidth),
                  generateGroupData(2, 1.3, 3.1, 2.8, barWidth),
                  generateGroupData(3, 3.1, 4, 3.1, barWidth),
                  generateGroupData(4, 0.8, 3.3, 3.4, barWidth),
                  generateGroupData(5, 2, 5.6, 1.8, barWidth),
                  generateGroupData(6, 1.3, 3.2, 2, barWidth),
                  generateGroupData(7, 2.3, 3.2, 3, barWidth),
                  generateGroupData(8, 2, 4.8, 2.5, barWidth),
                  generateGroupData(9, 1.2, 3.2, 2.5, barWidth),
                  generateGroupData(10, 1, 4.8, 3, barWidth),
                  generateGroupData(11, 2, 4.4, 2.8, barWidth),
                ],
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: pilateColor.withValues(alpha: 0.5),
                      strokeWidth: 1,
                      dashArray: [10, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: quickWorkoutColor.withValues(alpha: 0.5),
                      strokeWidth: 1,
                      dashArray: [10, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: cyclingColor.withValues(alpha: 0.5),
                      strokeWidth: 1,
                      dashArray: [10, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
