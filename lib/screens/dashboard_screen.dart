import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testweb/theme/app_theme.dart';
import 'package:testweb/widgets/header.dart';
import 'package:testweb/widgets/sidebar.dart';
import 'package:testweb/widgets/stat_card.dart';
import 'package:testweb/widgets/charts/stock_bar_chart.dart';
import 'package:testweb/widgets/charts/vendor_stacked_bar_chart.dart';
// import 'package:testweb/widgets/charts/simple_line_chart.dart';
import 'package:testweb/widgets/charts/active_subscriptions_chart.dart';
import 'package:testweb/widgets/charts/device_alerts_chart.dart';
import 'package:testweb/widgets/charts/product_orders_chart.dart';
import 'package:testweb/widgets/charts/device_health_chart.dart';
import 'package:testweb/widgets/device_registrations_table.dart';
import 'package:testweb/widgets/footer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Column(
              children: [
                const Header(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Stats Row
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double width = constraints.maxWidth;
                            int crossAxisCount = width > 1200
                                ? 4
                                : (width > 800 ? 2 : 1);
                            double aspectRatio = width > 1200 ? 1.7 : 1.5;

                            return GridView.count(
                              crossAxisCount: crossAxisCount,
                              shrinkWrap: true,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              childAspectRatio: aspectRatio,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                StatCard(
                                  title: 'Total Devices',
                                  value: '20',
                                  subtitle: 'Total Devices',
                                  backgroundColor: AppTheme.cardPurple,
                                  iconColor: Colors.deepPurple,
                                  backgroundIcon: Icons.devices,
                                  stats: const [
                                    Text(
                                      '45 Components',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '8 Appliances',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                  // trailing: TextButton(
                                  //   onPressed: () {},
                                  //   child: const Text('view mo re >'),
                                  // ),
                                ),
                                const StatCard(
                                  title: 'System Integrators',
                                  value: '8',
                                  subtitle: 'Total',
                                  backgroundColor: AppTheme.cardCream,
                                  backgroundIcon:
                                      Icons.settings_input_component,
                                  iconColor: Color.fromARGB(255, 206, 189, 32),
                                  stats: [
                                    Text(
                                      '237 Customers',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '10 Devices',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                StatCard(
                                  title: 'Customers',
                                  value: '10',
                                  subtitle: 'Customers',
                                  backgroundColor: AppTheme.cardYellow,
                                  backgroundIcon: Icons.people_outline,
                                  iconColor: const Color.fromARGB(
                                    255,
                                    103,
                                    103,
                                    4,
                                  ),
                                  stats: const [
                                    Text(
                                      '20 Devices',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                  // trailing: TextButton(
                                  //   onPressed: () {},
                                  //   child: const Text('view more >'),
                                  // ),
                                ),
                                const StatCard(
                                  title: 'Vendors',
                                  value: '10',
                                  subtitle: 'Vendors',
                                  backgroundColor: AppTheme.cardBlue,
                                  backgroundIcon:
                                      Icons.store_mall_directory_outlined,
                                  iconColor: Color.fromARGB(255, 18, 96, 159),
                                  stats: [
                                    Text(
                                      '5 Devices',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24),

                        // Charts Row 1
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: StockBarChart(),
                              ), // Was 2
                              const SizedBox(width: 24),
                              const Expanded(
                                flex: 1,
                                child: VendorStackedBarChart(),
                              ), // Was 3
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Charts Row 2
                        // Charts Row 2 - Active Subscriptions & Device Alerts
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: ActiveSubscriptionsChart(),
                              ),
                              const SizedBox(width: 24),
                              const Expanded(
                                flex: 1,
                                child: DeviceAlertsChart(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Charts Row 3 - Product Orders, Device Health & Device Registrations
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 2,
                                child: ProductOrdersChart(),
                              ),
                              const SizedBox(width: 24),
                              const Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: DeviceHealthChart(),
                                ),
                              ),
                              const SizedBox(width: 24),
                              const Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: DeviceRegistrationsTable(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
