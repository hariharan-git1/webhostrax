import 'package:flutter/material.dart';

class DeviceRegistrationsTable extends StatelessWidget {
  const DeviceRegistrationsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Device Registrations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () {}, child: const Text('View All >')),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView( // for vertical if needed, though usually fixed height in dashboard
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.grey.shade50),
                  columnSpacing: 24,
                  horizontalMargin: 12,
                  columns: const [
                    DataColumn(label: Text('Device ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                    DataColumn(label: Text('Device Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                    DataColumn(label: Text('Vendor Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                    DataColumn(label: Text('Submitted Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                    DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                  ],
                  rows: [
                    _buildRow(
                      context, 'VD2568', 'Smart CO2 Sensor', 'EnvoTech\nInstruments', '25 Dec 2025', 'Pending', Colors.amber.shade100, Colors.amber.shade900
                    ),
                    _buildRow(
                      context, 'VD10231', '3phase servo-IOT', '3phase servo\nSolutions', '18 Dec 2025', 'Approved', Colors.green.shade100, Colors.green.shade900
                    ),
                    _buildRow(
                      context, 'VD12368', 'Air Quality Monitor', 'EnvirSense\nTech', '10 Dec 2025', 'Need Action', Colors.orange.shade100, Colors.orange.shade900
                    ),
                    _buildRow(
                      context, 'VD10221', 'Wireless Gateway', 'NetWave\nTechnologies', '05 Dec 2025', 'Approved', Colors.green.shade100, Colors.green.shade900
                    ),
                    _buildRow(
                      context, 'VD40257', 'Temperature Sensor', 'CoolTrack\nSystems', '30 Nov 2025', 'Rejected', Colors.red.shade100, Colors.red.shade900
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

  DataRow _buildRow(BuildContext context, String id, String name, String vendor, String date, String status, Color chipBg, Color chipText) {
    return DataRow(
      cells: [
        DataCell(Row(children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue.shade900)),
          const SizedBox(width: 8),
          Text(id, style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold)),
        ])),
        DataCell(Text(name, style: const TextStyle(fontWeight: FontWeight.bold))), // Bold Device Name
        DataCell(Text(vendor, style: const TextStyle(fontSize: 12))),
        DataCell(Text(date, style: const TextStyle(fontSize: 12))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: chipBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status, style: TextStyle(color: chipText, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
