import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActiveSubscriptionsChart extends StatelessWidget {
  const ActiveSubscriptionsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Active Subscriptions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(onPressed: () {}, child: const Text('view more >')),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: Colors.grey.shade100, strokeWidth: 1),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval:
                            2, // Show every 2nd month to avoid crowding if needed, or 1 if it fits
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Jan', style: style);
                            case 1:
                              return const Text('Feb', style: style);
                            case 2:
                              return const Text('Mar', style: style);
                            case 3:
                              return const Text('Apr', style: style);
                            case 4:
                              return const Text('May', style: style);
                            case 5:
                              return const Text('Jun', style: style);
                            case 6:
                              return const Text('Jul', style: style);
                            case 7:
                              return const Text('Aug', style: style);
                            case 8:
                              return const Text('Sep', style: style);
                            case 9:
                              return const Text('Oct', style: style);
                            case 10:
                              return const Text('Nov', style: style);
                            case 11:
                              return const Text('Dec', style: style);
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 15),
                        FlSpot(1, 22),
                        FlSpot(2, 40),
                        FlSpot(3, 35),
                        FlSpot(4, 25),
                        FlSpot(5, 30),
                        FlSpot(6, 42),
                        FlSpot(7, 38),
                        FlSpot(8, 20),
                        FlSpot(9, 28),
                        FlSpot(10, 35),
                        FlSpot(11, 45),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 5,
                      dotData: FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 25),
                        FlSpot(1, 18),
                        FlSpot(2, 30),
                        FlSpot(3, 20),
                        FlSpot(4, 35),
                        FlSpot(5, 28),
                        FlSpot(6, 32),
                        FlSpot(7, 25),
                        FlSpot(8, 38),
                        FlSpot(9, 22),
                        FlSpot(10, 30),
                        FlSpot(11, 28),
                      ],
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: 5,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                  minY: 0,
                  maxY: 50,
                  minX: 0,
                  maxX: 11,
                ),
              ),
            ),
          ),
          const Spacer(),
          // Specific Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconStat(Colors.blue, Icons.check_circle, '50 Active'),
                Container(height: 24, width: 1, color: Colors.grey.shade300),
                _buildIconStat(Colors.orange, Icons.autorenew, '12 Renewed'),
                Container(height: 24, width: 1, color: Colors.grey.shade300),
                _buildIconStat(Colors.red, Icons.error_outline, '8 Expiring'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconStat(Color color, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }
}
