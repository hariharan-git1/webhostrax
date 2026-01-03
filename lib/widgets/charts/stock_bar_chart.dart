import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';

class StockBarChart extends StatelessWidget {
  const StockBarChart({super.key});

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
                const Text('Stock Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                  maxY: 20,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group) => Colors.blueGrey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
                      sideTitles: SideTitles(showTitles: true, interval: 5, reservedSize: 28),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 1), // Black axis line
                      left: BorderSide(color: Colors.black, width: 1),  // Black axis line
                    ),
                  ),
                  barGroups: [
                    makeGroupData(0, 15.0),
                    makeGroupData(1, 12.0),
                    makeGroupData(2, 18.0),
                    makeGroupData(3, 10.0),
                    makeGroupData(4, 14.0),
                    makeGroupData(5, 9.0),
                    makeGroupData(6, 16.0),
                    makeGroupData(7, 12.0),
                    makeGroupData(8, 11.0),
                    makeGroupData(9, 13.0),
                    makeGroupData(10, 15.0),
                    makeGroupData(11, 8.0),
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
                    _buildBigLegend('20', 'Available', Colors.green),
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    _buildBigLegend('10', 'Low Stock', Colors.orange),
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    _buildBigLegend('20', 'Out of Stock', const Color(0xFFEF5350)), 
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

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF90CAF9),
          width: 30,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildBigLegend(String value, String label, Color iconColor) {
    return Row(
      children: [
        if(label.isEmpty) ...[ // Special case for "Out of Stock" if it has no value prefix in design? Image shows "Out of Stock" next to red icon.
           Container(width: 16, height: 16, decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(4))),
           const SizedBox(width: 8),
           Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
        ] else ...[
           // For "20 Available" style
          // Wait, design 2 shows: [Icon] [Big Number] [Text]
          // Actually it looks like: "20 Available" where 20 is big.
           // Let's approximated: 
           Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
           const SizedBox(width: 4),
           Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ]
      ],
    );
  }
}
