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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Device Registrations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(onPressed: () {}, child: const Text('view more >')),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 600,
                  ), // Ensure min width for readability
                  child: DataTable(
                    dataRowMinHeight: 40,
                    dataRowMaxHeight: 40,
                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade50,
                    ),
                    columnSpacing: 10,
                    horizontalMargin: 8,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Device ID',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Device Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Vendor Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Submitted Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      _buildRow(
                        context,
                        'VD2568',
                        'Smart CO2 Sensor',
                        'EnvoTech\nInstruments',
                        '25 Dec 2025',
                        'Pending',
                        Colors.amber.shade100,
                        Colors.amber.shade900,
                      ),
                      _buildRow(
                        context,
                        'VD10231',
                        '3phase servo-IOT',
                        '3phase servo\nSolutions',
                        '18 Dec 2025',
                        'Approved',
                        Colors.green.shade100,
                        Colors.green.shade900,
                      ),
                      _buildRow(
                        context,
                        'VD12368',
                        'Air Quality Monitor',
                        'EnvirSense\nTech',
                        '10 Dec 2025',
                        'Need Action',
                        Colors.orange.shade100,
                        Colors.orange.shade900,
                      ),
                      _buildRow(
                        context,
                        'VD10221',
                        'Wireless Gateway',
                        'NetWave\nTechnologies',
                        '05 Dec 2025',
                        'Approved',
                        Colors.green.shade100,
                        Colors.green.shade900,
                      ),
                      _buildRow(
                        context,
                        'VD40257',
                        'Temperature Sensor',
                        'CoolTrack\nSystems',
                        '30 Nov 2025',
                        'Rejected',
                        Colors.red.shade100,
                        Colors.red.shade900,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(
    BuildContext context,
    String id,
    String name,
    String vendor,
    String date,
    String status,
    Color chipBg,
    Color chipText,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                id,
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ),
        DataCell(Text(vendor, style: const TextStyle(fontSize: 11))),
        DataCell(Text(date, style: const TextStyle(fontSize: 11))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: chipBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: chipText,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
