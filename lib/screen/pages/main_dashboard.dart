import 'package:admin_abzenzee/widget/card_main_dashboard.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF4F4FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
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
                  for (int i = 0; i < 4; i++)
                    Expanded(child: const CardMainDashboard()),
                ],
              ),
            ),
            
            //HALAMAN//------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
