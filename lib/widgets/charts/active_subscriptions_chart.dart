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
                          if (flSpot.x == 0 || flSpot.x == 11) {
                           // return null;
                          }
                          
                          TextStyle textStyle;
                          String label;
                          
                          // Identify the line by color or index
                          if (barSpot.barIndex == 0) { // Blue -> Active
                             textStyle = const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
                             label = 'active';
                          } else if (barSpot.barIndex == 1) { // Orange -> Renewal
                             textStyle = const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);
                             label = 'renewal';
                          } else { // Red -> Expiring
                             textStyle = const TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
                             label = 'expiring';
                          }

                          if (barSpot.barIndex == 0) {
                             return LineTooltipItem(
                               '$weekDay\n',
                               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                               textAlign: TextAlign.left,
                               children: [
                                  TextSpan(
                                    text: '$label : ${flSpot.y.toInt()}', 
                                    style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal)
                                  ),
                               ]
                             );
                          } else {
                             return LineTooltipItem(
                               '$label : ${flSpot.y.toInt()}',
                               textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
                               textAlign: TextAlign.left,
                             );
                          }

                          // BETTER APPROACH:
                          // Item 0: Text = "Jan\n", Children = [Span("active: 42")]
                          // Item 1: Text = "renewal: 30", Children = []
                          
                          if (barSpot.barIndex == 0) {
                             return LineTooltipItem(
                               '$weekDay\n',
                               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                               children: [
                                  TextSpan(
                                    text: '$label : ${flSpot.y.toInt()}', 
                                    style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal)
                                  ),
                               ]
                             );
                          } else {
                             return LineTooltipItem(
                               '$label : ${flSpot.y.toInt()}',
                               textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
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
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 10),
                        FlSpot(1, 15),
                        FlSpot(2, 12),
                        FlSpot(3, 18),
                        FlSpot(4, 14),
                        FlSpot(5, 10),
                        FlSpot(6, 16),
                        FlSpot(7, 12),
                        FlSpot(8, 15),
                        FlSpot(9, 8),
                        FlSpot(10, 12),
                        FlSpot(11, 10),
                      ],
                      isCurved: true,
                      color: Colors.red,
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
