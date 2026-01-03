import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAX TASK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isLargeScreen = width > 1400;
    final bool isMediumScreen = width > 1100;
    final bool isSmallScreen = width <= 1100;

    final int crossCountTop = isLargeScreen ? 4 : (isMediumScreen ? 3 : 2);

    final int crossCountMid = width > 1000 ? 3 : 2;

    final int crossCountBottom = isLargeScreen || isMediumScreen ? 3 : 2;

    final EdgeInsets contentPadding = width > 1300
        ? const EdgeInsets.all(24)
        : const EdgeInsets.all(16);

    final double topCardAspectRatio = isLargeScreen
        ? 1.6
        : (isMediumScreen ? 1.4 : 1.2);

    final double bottomCardAspectRatio = isLargeScreen
        ? 1.7
        : (isMediumScreen ? 1.5 : 1.2);

    return Scaffold(
      body: Row(
        children: [
          _buildSideMenu(),
          Expanded(
            child: SingleChildScrollView(
              padding: contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Engineer Dashboard',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_none),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 12),

                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Hariharan Uthamanathan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'System engineer',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.person, size: 22),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    'Overview of devices, integrators, stocks, vendors, alerts, and subscriptions.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  GridView.count(
                    crossAxisCount: crossCountTop,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: topCardAspectRatio,
                    children: [
                      _buildTopCard(
                        'Total Devices',
                        '20 ',
                        '  Total Devices',
                        '45 Components\n8 Appliances\n8 Appliances',
                        Colors.blue[100]!,
                        Icons.devices,
                        gradientStart: const Color.fromARGB(255, 146, 167, 235),
                        gradientEnd: const Color(0xFF9DB7FF),
                        showViewStock: true,
                      ),

                      _buildTopCard(
                        'System Integrators',
                        '8',
                        '  Total',
                        '237 Customers\n+4.9%\nLast 30 Days',
                        Colors.amber[100]!,
                        Icons.account_tree,
                        gradientStart: const Color(0xFFFFC371),
                        gradientEnd: const Color(0xFFFFE3A3),
                        hasChart: true,
                        showViewStock: false,
                      ),

                      _buildTopCard(
                        'Customers',
                        '10',
                        '  Customers',
                        '20 Devices\n18 \nNew Orders',
                        Colors.green[100]!,
                        Icons.people,
                        gradientStart: const Color(0xFF6DD5A7),
                        gradientEnd: const Color(0xFFB9F2D0),
                        hasSmallCharts: true,
                        showViewStock: true,
                      ),

                      _buildTopCard(
                        'Vendors',
                        '10',
                        '  Vendors',
                        '5 Pending\n10 Offline\n20 Out of Stock',
                        Colors.purple[100]!,
                        Icons.store,
                        gradientStart: const Color(0xFFB084F9),
                        gradientEnd: const Color(0xFFD5C2FF),
                        hasPie: true,
                        showViewStock: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  GridView.count(
                    crossAxisCount: crossCountMid,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: width > 1200 ? 1.8 : 1.6,
                    children: [
                      _buildBarChartCard('Stock Overview', true),
                      _buildBarChartCard('Vendor Device Registration', false),
                      _buildPieChartCard('Device Health', isdevice: true),
                    ],
                  ),
                  const SizedBox(height: 32),

                  GridView.count(
                    crossAxisCount: crossCountBottom,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 34,
                    crossAxisSpacing: 34,
                    childAspectRatio: bottomCardAspectRatio,
                    children: [
                      _buildLineChartCard('Active Subscriptions'),
                      _buildLineChartCard('Device Alerts', isAlert: true),
                      _buildPieChartCard('Product Orders'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo[900],
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 500,
              child: const Text(
                'FIOT DATA MASTER',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Container(
              width: 500,
              child: const Text(
                '© 2025 Rax Tech International',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Container(
              width: 500,
              child: Row(
                children: [
                  SizedBox(width: 300),
                  const Text(
                    'Privacy',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Terms',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Help',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopCard(
    String title,
    String mainText,
    String maintext1,
    String subText,
    Color bgColor,
    IconData icon, {
    Color? gradientStart,
    Color? gradientEnd,
    bool hasChart = false,
    bool hasSmallCharts = false,
    bool hasPie = false,
    bool showViewStock = true,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      gradientStart ?? bgColor,
                      gradientEnd ?? bgColor.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: mainText,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: maintext1,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: subText.split('\n').map((line) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Expanded(
                                  child: RichText(text: _buildStyledLine(line)),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    if (hasChart)
                      SizedBox(width: 90, height: 70, child: _miniDonutChart()),

                    if (hasSmallCharts)
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              _miniBar(247, Colors.green),
                              const SizedBox(height: 8),
                              _miniBar(14, Colors.orange),
                              const SizedBox(height: 8),
                              _miniBar(6, Colors.red),
                            ],
                          ),
                        ),
                      ),

                    if (hasPie)
                      SizedBox(width: 90, height: 90, child: _miniPieChart()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 15,
          child: Icon(icon, size: 54, color: Colors.indigo[700]),
        ),

        if (showViewStock)
          Positioned(
            bottom: 4,
            right: 8,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View Stock >',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _miniBar(double value, Color color) {
    return Row(
      children: [
        Container(width: 20, height: 20, color: color),
        const SizedBox(width: 10),
        Text(value.toInt().toString(), style: const TextStyle(fontSize: 15)),
      ],
    );
  }

  Widget _miniDonutChart() {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 20,
        sectionsSpace: 4,
        sections: [
          PieChartSectionData(
            value: 60,
            color: Colors.green,
            radius: 18,
            showTitle: false,
          ),
          PieChartSectionData(
            value: 25,
            color: Colors.orange,
            radius: 18,
            showTitle: false,
          ),
          PieChartSectionData(
            value: 15,
            color: Colors.red,
            radius: 18,
            showTitle: false,
          ),
        ],
      ),
    );
  }

  TextSpan _buildStyledLine(String line) {
    final trimmed = line.trim();

    if (trimmed.startsWith('+') || trimmed.startsWith('-')) {
      return TextSpan(
        text: trimmed,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      );
    }

    final parts = trimmed.split(' ');
    final first = parts.first;

    if (RegExp(r'^\d+$').hasMatch(first)) {
      return TextSpan(
        children: [
          TextSpan(
            text: first,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: ' ${parts.skip(1).join(' ')}',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      );
    }

    return TextSpan(
      text: trimmed,
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _miniPieChart() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              centerSpaceRadius: 30,
              sectionsSpace: 4,
              sections: [
                PieChartSectionData(
                  value: 71,
                  color: Colors.red[400],
                  radius: 20,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 20,
                  color: Colors.green[400],
                  radius: 20,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 9,
                  color: Colors.blue[300],
                  radius: 20,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Text(
            '   71%\nStreck',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStockBarColor(double value) {
    if (value <= 5) {
      return Colors.red.shade400;
    } else if (value <= 10) {
      return Colors.orange.shade400;
    } else if (value <= 15) {
      return Colors.yellow.shade700;
    } else {
      return Colors.green.shade400;
    }
  }

  Widget _buildBarChartCard(String title, bool isStock) {
    final months = ['Jan', 'Feb', 'Mar', 'Jun', 'Jul', 'Aug'];
    final stockData = [8.0, 12.0, 15.0, 10.0, 14.0, 8.0];

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('view more >', style: TextStyle(fontSize: 12)),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,

                  barGroups: List.generate(
                    months.length,
                    (index) => BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: stockData[index],
                          width: 10,
                          color: _getStockBarColor(stockData[index]),
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                  ),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 0,
                        color: Colors.black54,
                        strokeWidth: 1.2,
                      ),
                    ],
                  ),

                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) {
                      if (value == 0) {
                        return FlLine(color: Colors.black54, strokeWidth: 1.2);
                      } else if (value == 5) {
                        return FlLine(color: Colors.black54, strokeWidth: 0.8);
                      } else if (value == 10) {
                        return FlLine(color: Colors.black54, strokeWidth: 0.8);
                      } else if (value == 15) {
                        return FlLine(color: Colors.black54, strokeWidth: 0.8);
                      } else if (value == 20) {
                        return FlLine(color: Colors.black54, strokeWidth: 0.8);
                      }
                      return FlLine(color: Colors.transparent);
                    },
                  ),

                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        reservedSize: 26,
                        getTitlesWidget: (value, _) => Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) => Text(
                          months[value.toInt()],
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6),
            isStock == true
                ? Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 240, 236, 236),
                          Color.fromARGB(255, 240, 236, 236),
                          Color(0xFFBDBDBD),
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _statusText("20", "Available"),
                        ),
                        const VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                          width: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: _statusText("10", "Low Stock"),
                        ),
                        const VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                          width: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: _statusText("30", "Out of Stock"),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 240, 236, 236),
                          Color.fromARGB(255, 240, 236, 236),
                          Color(0xFFBDBDBD),
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: _statusText("20", "Pending")),
                        const VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                          width: 1,
                        ),
                        Expanded(flex: 1, child: _statusText("10", "Verified")),
                        const VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                          width: 1,
                        ),
                        Expanded(flex: 1, child: _statusText("30", "Approved")),
                        const VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                          width: 1,
                        ),
                        Expanded(flex: 1, child: _statusText("29", "reject")),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _statusText(String value, String label) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _legendChip(String text, Color color) {
    return Chip(backgroundColor: color.withOpacity(0.2), label: Text(text));
  }

  Widget _buildLineChartCard(String title, {bool isAlert = false}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('view more >')),
              ],
            ),
            const Divider(color: Colors.black26, thickness: 1),
            const SizedBox(height: 12),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(show: true),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.blue,
                            spots: const [
                              FlSpot(0, 10),
                              FlSpot(1, 20),
                              FlSpot(2, 35),
                              FlSpot(3, 30),
                            ],
                          ),
                          if (!isAlert)
                            LineChartBarData(
                              isCurved: true,
                              barWidth: 3,
                              color: Colors.orange,
                              spots: const [
                                FlSpot(0, 5),
                                FlSpot(1, 15),
                                FlSpot(2, 25),
                                FlSpot(3, 20),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (isAlert == false)
                    Expanded(
                      child: Column(
                        spacing: 3,
                        children: [
                          Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 240, 236, 236),
                                  Color.fromARGB(255, 218, 214, 214),
                                ],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _statusText("", "Active"),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: _statusText("", "Renewal"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 240, 236, 236),
                                  Color.fromARGB(255, 218, 214, 214),
                                ],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _statusText("", "Renewal"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: isAlert ? [] : [],
            ),

            const SizedBox(height: 10),

            isAlert == false
                ? Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFBDBDBD),
                          Color(0xFFBDBDBD),
                          Color(0xFFBDBDBD),
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: _statusText("20", "Active")),
                        Expanded(flex: 1, child: _statusText("10", "Renewed")),
                        Expanded(flex: 1, child: _statusText("-2", "Expiring")),
                      ],
                    ),
                  )
                : Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFBDBDBD),
                          Color(0xFFBDBDBD),
                          Color(0xFFBDBDBD),
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: _statusText("20", "Pending")),
                        Expanded(flex: 1, child: _statusText("101", "remde")),
                        Expanded(flex: 1, child: _statusText("12", "fault")),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChartCard(String title, {bool isdevice = false}) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isdevice == true ? 20 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('view more >')),
              ],
            ),
            if (isdevice == false) Divider(color: Colors.black26, thickness: 1),
            isdevice == true ? SizedBox(height: 40) : SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        isdevice == true
                            ? PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      value: 20,
                                      radius: 20,
                                      color: Colors.orange,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      value: 40,
                                      radius: 20,
                                      color: Colors.blue,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      value: 40,
                                      color: Colors.teal,
                                      radius: 20,
                                      title: '',
                                    ),
                                  ],
                                  centerSpaceRadius: 50,
                                ),
                              )
                            : PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      value: 20,
                                      radius: 20,
                                      color: Colors.orange,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      value: 40,
                                      radius: 20,
                                      color: Colors.blue,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      value: 40,
                                      color: Colors.teal,
                                      radius: 20,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      value: 40,
                                      color: Colors.red,
                                      radius: 20,
                                      title: '',
                                    ),
                                  ],
                                  centerSpaceRadius: 50,
                                ),
                              ),

                        const Center(
                          child: Text(
                            '20\nTotal\nDevices',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                isdevice == true
                    ? Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLegendRow(Colors.blue, 'TOTAL', '20'),
                            const SizedBox(height: 12),
                            _buildLegendRow(Colors.cyan, 'OUTLINR', '40'),
                            const SizedBox(height: 12),
                            _buildLegendRow(Colors.orange, 'OFFICE', '40'),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLegendRow(Colors.blue, '10 Pending', '20%'),
                            const SizedBox(height: 12),
                            _buildLegendRow(Colors.cyan, '20 Shipping', '40%'),
                            const SizedBox(height: 12),
                            _buildLegendRow(
                              Colors.orange,
                              '40 Delivered',
                              '40%',
                            ),
                            const SizedBox(height: 12),
                            _buildLegendRow(Colors.red, '40 Reurned', '30%'),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLegendRow(Color color, String countLabel, String percentage) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
      const SizedBox(width: 12),
      Text(
        countLabel,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      const SizedBox(width: 8),
      Text(
        percentage,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
    ],
  );
}

Widget _buildSideMenu() {
  return Container(
    width: 80,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0D1B4C), Color(0xFF132A7C)],
      ),
    ),
    child: Column(
      children: [
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'FIOT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF132A7C),
            ),
          ),
        ),

        const SizedBox(height: 30),

        _menuIcon(Icons.grid_view, isActive: true),
        _menuIcon(Icons.home),
        _menuIcon(Icons.check_circle_outline),
        _menuIcon(Icons.person_outline),

        const Spacer(),

        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'V2.1.0',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

Widget _menuIcon(IconData icon, {bool isActive = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: Colors.white),
    ),
  );
}

class _SummaryText extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryText({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(value, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
