import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class VendorStackedBarChart extends StatelessWidget {
  const VendorStackedBarChart({super.key});

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
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vendor Device Registration',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(onPressed: () {}, child: const Text('view more >')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 250, // Reduced height
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 60,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBorder:  const BorderSide(color: Colors.black),
                      getTooltipColor: (_) => Colors.white,
                 //     getTooltipBorder: (_) => const BorderSide(color: Colors.black),
                      tooltipPadding: const EdgeInsets.all(8),
                      tooltipMargin: 8,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String weekDay;
                        switch (group.x.toInt()) {
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
                          default: throw Error();
                        }
                        // rodStackItems has the accumulated values, we need individual values.
                        // However, we passed them into the group.
                        // We can access the original values if we knew how they were constructed.
                        // Since we are inside the chart, we might only have rod.rodStackItems.
                        // rod.rodStackItems[0].toY is the first value (e.g. 10)
                        // rod.rodStackItems[1].toY is the cumulative (e.g. 10+5=15)
                        // rod.rodStackItems[2].toY is the cumulative (e.g. 15+2=17)
                        
                        // BUT, looking at how `_makeGroupData` constructs it:
                        // Item 0: from 0 to values[0] -> toY = values[0]
                        // Item 1: from values[0] to values[0]+values[1] -> toY = values[0]+values[1]
                        
                        double pending = rod.rodStackItems[0].toY; 
                        double approved = rod.rodStackItems[1].toY - rod.rodStackItems[0].toY;
                        double verified = rod.rodStackItems[2].toY - rod.rodStackItems[1].toY;

                        return BarTooltipItem(
                          '$weekDay\n',
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'approved : ${approved.toInt()}\n',
                              style: const TextStyle(
                                color: Color(0xFF4DB6AC), // Teal (Approved)
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                             TextSpan(
                              text: 'pending : ${pending.toInt()}\n',
                              style: const TextStyle(
                                color: Color(0xFF64B5F6), // Blue (Pending)
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                             TextSpan(
                              text: 'verified : ${verified.toInt()}',
                              style: const TextStyle(
                                color: Color(0xFFFFD54F), // Yellow (Verified)
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Jan';
                              break;
                            case 1:
                              text = 'Feb';
                              break;
                            case 2:
                              text = 'Mar';
                              break;
                            case 3:
                              text = 'Apr';
                              break;
                            case 4:
                              text = 'May';
                              break;
                            case 5:
                              text = 'Jun';
                              break;
                            case 6:
                              text = 'Jul';
                              break;
                            case 7:
                              text = 'Aug';
                              break;
                            case 8:
                              text = 'Sep';
                              break;
                            case 9:
                              text = 'Oct';
                              break;
                            case 10:
                              text = 'Nov';
                              break;
                            case 11:
                              text = 'Dec';
                              break;
                            default:
                              text = '';
                          }
                          return Text(
                            text,
                            style: style,
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 15,
                        reservedSize: 28,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 15,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ), // Black axis line
                      left: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ), // Black axis line
                    ),
                  ),
                  barGroups: [
                    _makeGroupData(0, [10.0, 5.0, 2.0]),
                    _makeGroupData(1, [12.0, 6.0, 3.0]),
                    _makeGroupData(2, [15.0, 8.0, 4.0]),
                    _makeGroupData(3, [18.0, 10.0, 5.0]),
                    _makeGroupData(4, [20.0, 12.0, 6.0]),
                    _makeGroupData(5, [16.0, 9.0, 4.0]),
                    _makeGroupData(6, [14.0, 8.0, 3.0]),
                    _makeGroupData(7, [10.0, 5.0, 2.0]),
                    _makeGroupData(8, [12.0, 7.0, 4.0]),
                    _makeGroupData(9, [18.0, 10.0, 6.0]),
                    _makeGroupData(10, [14.0, 6.0, 3.0]),
                    _makeGroupData(11, [16.0, 9.0, 5.0]),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Footer Refinement
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconStat(
                      const Color(0xFF64B5F6),
                      Icons.hourglass_top,
                      '10 Pending',
                    ),Container(height: 24, width: 1, color: Colors.grey.shade300),
                    _buildIconStat(
                      const Color(0xFFFFD54F),
                      Icons.verified_user,
                      '20 Verified',
                    ),Container(height: 24, width: 1, color: Colors.grey.shade300),
                    _buildIconStat(
                      const Color(0xFF4DB6AC),
                      Icons.check_circle,
                      '2 Approved',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, List<double> values) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: values.reduce((a, b) => a + b),
          rodStackItems: [
            BarChartRodStackItem(0, values[0], const Color(0xFF64B5F6)), // Blue
            BarChartRodStackItem(
              values[0],
              values[0] + values[1],
              const Color(0xFF4DB6AC),
            ), // Teal
            BarChartRodStackItem(
              values[0] + values[1],
              values.reduce((a, b) => a + b),
              const Color(0xFFFFD54F),
            ), // Yellow
          ],
          width: 20,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  Widget _buildIconStat(Color color, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }
}
