import 'package:admin_abzenzee/widget/card_main_dashboard.dart';
import 'package:admin_abzenzee/widget/fl_chart_bar2.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

final List<Map<String, dynamic>> dashboardItems = [
  {'title': 'masuk', 'icon': FIcons.logIn, 'data': 100},
  {'title': 'izin', 'icon': FIcons.clock, 'data': 20},
  {'title': 'sakit', 'icon': FIcons.thermometer, 'data': 50},
  {'title': 'alpha', 'icon': FIcons.userX, 'data': 12},
];

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              //HALAMAN//------------------------------------------------------------
              Text(
                'Dashboard',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: MediaQuery.sizeOf(context).width < 800 ? 20 : 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final item in dashboardItems)
                      Expanded(
                        child: CardMainDashboard(
                          card_icon: item['icon'],
                          card_title: item['title'],
                          card_data: item['data'],
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: BarChartSample2(),
              ),
              //HALAMAN//------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
