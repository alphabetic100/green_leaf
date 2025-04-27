
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';

class MonthlyGraph extends StatelessWidget {
  const MonthlyGraph({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, int> valueCount = {};
    return LineChart(
      LineChartData(
        maxX: 5,
        minY: -0.4,
        maxY: 5,
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(color: Color(0xFF47BA80), strokeWidth: 0.5);
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return const FlLine(color: Colors.white, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Color(0XFFD9D9D9)),
        ),
        extraLinesData: ExtraLinesData(),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Color(0xFF2DF28F),
            spots: [
              const FlSpot(0, 2),
              const FlSpot(1, 3),
              const FlSpot(2, 4),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
              const FlSpot(5, 3),
            ],
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary.withAlpha(5), AppColors.white],
              ),
              // color: AppColors.primary,
            ),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false, reservedSize: 30),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,

              getTitlesWidget: (value, meta) {
                final cleanValue = int.parse(value.toString().split(".")[0]);
                if (!valueCount.containsKey(cleanValue)) {
                  valueCount[cleanValue] = 0;
                }
                if (valueCount[cleanValue]! % 2 == 0) {
                  valueCount[cleanValue] = valueCount[cleanValue]! + 1;
                  return Column(
                    children: [
                      Text(dayTemp[cleanValue]["month"].toString()),
                      Text(dayTemp[cleanValue]["day"].toString()),
                    ],
                  );
                } else {
                  valueCount[cleanValue] = valueCount[cleanValue]! + 1;
                  return const SizedBox();
                }
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    );
  }
}

final dayTemp = [
  {"month": "Oct", "day": 24},
  {"month": "Nov", "day": 24},
  {"month": "Dec", "day": 24},
  {"month": "Jan", "day": 25},
  {"month": "Feb", "day": 25},
  {"month": "Mar", "day": 25},
  {"month": "Apr", "day": 24},
];
