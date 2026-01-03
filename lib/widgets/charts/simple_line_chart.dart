import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class SimpleLineChart extends StatelessWidget {
  final String title;
  final List<LineChartBarData> lineBarsData;
  final double maxY;
  
  const SimpleLineChart({
    super.key,
    required this.title,
    required this.lineBarsData,
    this.maxY = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () {}, child: const Text('View All >')),
            ],
          ),
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true, drawVerticalLine: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                         switch(value.toInt()) {
                           case 0: return const Text('Jan', style: TextStyle(fontSize: 10, color: Colors.grey));
                           case 1: return const Text('Feb', style: TextStyle(fontSize: 10, color: Colors.grey));
                           case 2: return const Text('Mar', style: TextStyle(fontSize: 10, color: Colors.grey));
                         }
                         return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 10, reservedSize: 28)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 2, // Jan, Feb, Mar
                maxY: maxY,
                lineBarsData: lineBarsData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
