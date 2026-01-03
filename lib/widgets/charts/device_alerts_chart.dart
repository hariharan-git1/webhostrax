import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DeviceAlertsChart extends StatelessWidget {
  const DeviceAlertsChart({super.key});

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
                  'Device Alerts',
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
                    horizontalInterval: 9,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: Colors.grey.shade100, strokeWidth: 1),
                  ),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => Colors.white,
                      tooltipBorder: const BorderSide(color: Colors.black),
                      tooltipPadding: const EdgeInsets.all(8),
                      tooltipMargin: 8,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                         String weekDay;
                        switch (touchedBarSpots[0].x.toInt()) {
                          case 0: weekDay = 'Jan'; break;
                          case 1: weekDay = 'Feb'; break;
                          case 2: weekDay = 'Mar'; break;
                          case 3: weekDay = 'Apr'; break;
                          case 4: weekDay = 'May'; break;
                          case 5: weekDay = 'Jun'; break;
                          case 6: weekDay = 'Jul'; break;
                          case 7: weekDay = 'Aug'; break;
                          case 8: weekDay = 'Sep'; break;
                          case 9: weekDay = 'Oct'; break;
                          case 10: weekDay = 'Nov'; break;
                          case 11: weekDay = 'Dec'; break;
                           default: weekDay = '';
                        }
                        
                         return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot;
                          
                          Color color;
                          String label;
                          
                          // Identify the line by barIndex
                          if (barSpot.barIndex == 0) { // Blue -> Pending
                             color = Colors.blue.shade300;
                             label = 'pending';
                          } else if (barSpot.barIndex == 1) { // Amber -> Vendor
                             color = Colors.amber;
                             label = 'vendor';
                          } else { // Red -> Fault
                             color = Colors.red.shade300;
                             label = 'fault';
                          }

                          if (barSpot.barIndex == 0) {
                             return LineTooltipItem(
                               '$weekDay\n',
                               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                               textAlign: TextAlign.left,
                               children: [
                                  TextSpan(
                                    text: '$label : ${flSpot.y.toInt()}', 
                                    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.normal)
                                  ),
                               ]
                             );
                          } else {
                             return LineTooltipItem(
                               '$label : ${flSpot.y.toInt()}',
                               TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.normal),
                               textAlign: TextAlign.left,
                             );
                          }
                        }).toList();
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 2,
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
                        interval: 9,
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
                        FlSpot(0, 20),
                        FlSpot(1, 26),
                        FlSpot(2, 22),
                        FlSpot(3, 28),
                        FlSpot(4, 25),
                        FlSpot(5, 30),
                        FlSpot(6, 26),
                        FlSpot(7, 22),
                        FlSpot(8, 28),
                        FlSpot(9, 32),
                        FlSpot(10, 29),
                        FlSpot(11, 35),
                      ],
                      isCurved: true,
                      color: Colors.blue.shade300,
                      barWidth: 5,
                      dotData: FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 24),
                        FlSpot(1, 18),
                        FlSpot(2, 35),
                        FlSpot(3, 30),
                        FlSpot(4, 28),
                        FlSpot(5, 32),
                        FlSpot(6, 28),
                        FlSpot(7, 34),
                        FlSpot(8, 26),
                        FlSpot(9, 30),
                        FlSpot(10, 32),
                        FlSpot(11, 38),
                      ],
                      isCurved: true,
                      color: Colors.amber,
                      barWidth: 5,
                      dotData: FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 15),
                        FlSpot(1, 24),
                        FlSpot(2, 30),
                        FlSpot(3, 22),
                        FlSpot(4, 26),
                        FlSpot(5, 20),
                        FlSpot(6, 25),
                        FlSpot(7, 28),
                        FlSpot(8, 24),
                        FlSpot(9, 18),
                        FlSpot(10, 22),
                        FlSpot(11, 26),
                      ],
                      isCurved: true,
                      color: Colors.red.shade300,
                      barWidth: 5,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                  minY: 0,
                  maxY: 45,
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
                _buildIconStat(
                  const Color(0xFF64B5F6),
                  Icons.hexagon,
                  'Pending',
                ), // Blue Hexagon
                Container(height: 24, width: 1, color: Colors.grey.shade300),
                _buildIconStat(
                  const Color(0xFF81C784),
                  Icons.view_in_ar,
                  '112 Vendor',
                ), // Green box
                Container(height: 24, width: 1, color: Colors.grey.shade300),
                _buildIconStat(
                  const Color(0xFFE57373),
                  Icons.shield,
                  '2 Fault',
                ), // Red shield
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
