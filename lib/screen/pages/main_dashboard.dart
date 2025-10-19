import 'package:admin_abzenzee/widget/card_main_dashboard.dart';
import 'package:admin_abzenzee/widget/const/default.dart';
import 'package:admin_abzenzee/widget/legend_widget.dart';
import 'package:admin_abzenzee/widget/template/fl_chart_bar6.dart';
import 'package:admin_abzenzee/widget/template/fl_chart_line2.dart';
import 'package:admin_abzenzee/widget/select_dropdown.dart';
import 'package:admin_abzenzee/widget/template/fl_chart_bar2.dart';
import 'package:admin_abzenzee/widget/user_activity_list.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

final List<Map<String, dynamic>> dashboardItems = [
  {
    'title': 'Masuk',
    'icon': FIcons.logIn,
    'data': 100,
    'desc': 'murid masuk hari ini',
  },
  {
    'title': 'Sakit',
    'icon': FIcons.thermometer,
    'data': 50,
    'desc': 'murid sakit hari ini',
  },
  {
    'title': 'Izin',
    'icon': FIcons.clock,
    'data': 20,
    'desc': 'murid izin hari ini',
  },
  {
    'title': 'Alpha',
    'icon': FIcons.userX,
    'data': 12,
    'desc': 'murid alpha hari ini',
  },
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                          card_description: item['desc'],
                        ),
                      ),
                  ],
                ),
              ),

              //GRAFIK KEHADIRAN & AKTIVITAS USER----------------------------------------
              Row(
                spacing: 32,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  //GRAFIK KEHADIRAN----------------------------------------------------
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: Container(
                        child: Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Grafik Kehadiran',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectPage(),
                                Wrap(
                                  alignment: WrapAlignment.end,
                                  spacing: 16,
                                  runSpacing: 4,
                                  children: [
                                    BuildLegendItem(masukBarColor, 'Masuk'),
                                    BuildLegendItem(sakitBarColor, 'Sakit'),
                                    BuildLegendItem(izinBarColor, 'Izin'),
                                    BuildLegendItem(alphaBarColor, 'Alpha'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              child: BarChartSample2(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //--RECENT ACTIVITY USER--------------------------------------------------
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.sizeOf(context).width * 0.02,
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Activity User',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(children: [
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //HALAMAN//------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
