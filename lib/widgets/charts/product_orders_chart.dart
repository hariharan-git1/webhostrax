import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductOrdersChart extends StatelessWidget {
  const ProductOrdersChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
              const Text(
                'Product Orders',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(onPressed: () {}, child: const Text('view more >')),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              SizedBox(
                height: 100,
                width: 120,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xFF64B5F6), // Blue
                            value: 20.0,
                            title: '',
                            radius: 20,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF81C784), // Green
                            value: 40.0,
                            title: '',
                            radius: 20,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFFFFD54F), // Yellow
                            value: 40.0,
                            title: '',
                            radius: 20,
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Total\nDevices',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  _buildLegendRow(const Color(0xFF64B5F6), '10 Pending', '20%'),
                  const SizedBox(height: 8),
                  _buildLegendRow(
                    const Color(0xFF81C784),
                    '20 Shipping',
                    '40%',
                  ),
                  const SizedBox(height: 8),
                  _buildLegendRow(
                    const Color(0xFFFFD54F),
                    '40 Delivered',
                    '40%',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendRow(Color color, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
