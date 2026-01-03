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
                const Text('Vendor Device Registration', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton(onPressed: () {}, child: const Text('View All >')),
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
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 12);
                           String text;
                          switch (value.toInt()) {
                            case 0: text = 'Jan'; break;
                            case 1: text = 'Feb'; break;
                            case 2: text = 'Mar'; break;
                            case 3: text = 'Apr'; break;
                            case 4: text = 'May'; break;
                            case 5: text = 'Jun'; break;
                            case 6: text = 'Jul'; break;
                            case 7: text = 'Aug'; break;
                            case 8: text = 'Sep'; break;
                            case 9: text = 'Oct'; break;
                            case 10: text = 'Nov'; break;
                            case 11: text = 'Dec'; break;
                            default: text = '';
                          }
                          return Text(text, style: style, textAlign: TextAlign.center);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, interval: 15, reservedSize: 28),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 15, getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade300, strokeWidth: 1, dashArray: [5, 5])),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 1), // Black axis line
                      left: BorderSide(color: Colors.black, width: 1),  // Black axis line
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
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
            ),
             child: Column(
               children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBigLegend('10', 'Pending', const Color(0xFF64B5F6)), // Blue icon in image
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    _buildBigLegend('20', 'Verified', const Color(0xFFFFD54F)), // Yellow
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    _buildBigLegend('2', 'Approved', const Color(0xFF4DB6AC)), // Teal
                  ],
                ),
                const SizedBox(height: 16),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text('Facilities of simple alerts', style: TextStyle(color: Colors.grey, fontSize: 12)),
                         const SizedBox(height: 4),
                         const Text('Facilities (Group)', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       ],
                     ),
                     ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B61F5), // Solid Blue
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('View Stock >'),
                    ),
                   ],
                 ),
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
            BarChartRodStackItem(values[0], values[0] + values[1], const Color(0xFF4DB6AC)), // Teal
            BarChartRodStackItem(values[0] + values[1], values.reduce((a, b) => a + b), const Color(0xFFFFD54F)), // Yellow
          ],
          width: 20,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

   Widget _buildBigLegend(String value, String label, Color iconColor) {
    return Row(
      children: [
         Container(width: 20, height: 20, decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(6))), // Icon box
         const SizedBox(width: 8),
         Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
         const SizedBox(width: 4),
         Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
