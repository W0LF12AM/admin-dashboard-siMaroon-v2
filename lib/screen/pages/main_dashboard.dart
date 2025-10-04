import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        //HALAMAN//------------------------------------------------------------
        Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: MediaQuery.sizeOf(context).width < 800 ? 10 : 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: MediaQuery.sizeOf(context).height * 0.15,
        //   decoration: BoxDecoration(color: Colors.black),
        // ),
        //HALAMAN//------------------------------------------------------------
      ],
    );
  }
}
