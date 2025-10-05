import 'package:admin_abzenzee/screen/pages/jadwal.dart';
import 'package:admin_abzenzee/screen/pages/kelas.dart';
import 'package:admin_abzenzee/screen/pages/log_out.dart';
import 'package:admin_abzenzee/screen/pages/lokasi.dart';
import 'package:admin_abzenzee/screen/pages/main_dashboard.dart';
import 'package:admin_abzenzee/screen/pages/riwayat_presensi.dart';
import 'package:admin_abzenzee/screen/pages/settings.dart';
import 'package:admin_abzenzee/screen/pages/users.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int? selectedIndex;

  void selectingIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      sidebar: FSidebar(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FIcons.layers,
                      size: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.004),
                    Text(
                      'Admin Dashboard',
                      style: context.theme.typography.lg.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.colors.foreground,
                        decoration: TextDecoration.none,
                        fontSize: MediaQuery.sizeOf(context).width < 800
                            ? 12
                            : 18,
                      ),
                    ),
                  ],
                ),
              ),
              FDivider(
                style: context.theme.dividerStyles.horizontalStyle.copyWith(
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
        footer: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FCard.raw(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                spacing: 10,
                children: [
                  FAvatar.raw(
                    child: Icon(
                      FIcons.userRound,
                      size: 18,
                      color: context.theme.colors.mutedForeground,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          'Admin',
                          style: context.theme.typography.sm.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.colors.foreground,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'admin@maroon.ac.id',
                          style: context.theme.typography.xs.copyWith(
                            color: context.theme.colors.mutedForeground,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        children: [
          FSidebarGroup(
            label: const Text(
              'Management',
              style: TextStyle(decoration: TextDecoration.none),
            ),
            children: [
              FSidebarItem(
                icon: const Icon(FIcons.layoutDashboard),
                label: const Text(
                  'Main Dashboard',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                selected: selectedIndex == 0,
                initiallyExpanded: true,
                onPress: () {
                  selectingIndex(0);
                },
              ),
              FSidebarItem(
                icon: const Icon(FIcons.squareChartGantt),
                label: const Text(
                  'Managerial',
                  style: TextStyle(decoration: TextDecoration.none),
                ),

                onPress: () {},
                children: [
                  FSidebarItem(
                    label: const Text(
                      'Riwayat Presensi',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: selectedIndex == 1,
                    initiallyExpanded: true,
                    onPress: () {
                      selectingIndex(1);
                    },
                  ),
                  FSidebarItem(
                    label: const Text(
                      'Lokasi',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: selectedIndex == 2,
                    onPress: () {
                      selectingIndex(2);
                    },
                  ),
                  FSidebarItem(
                    label: const Text(
                      'Users',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: selectedIndex == 3,
                    onPress: () {
                      selectingIndex(3);
                    },
                  ),
                ],
              ),
              FSidebarItem(
                icon: const Icon(FIcons.school),
                label: const Text(
                  'Kelas',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                selected: selectedIndex == 4,
                onPress: () {
                  selectingIndex(4);
                },
              ),
              FSidebarItem(
                icon: const Icon(FIcons.calendarDays),
                label: const Text(
                  'Jadwal',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                selected: selectedIndex == 5,
                onPress: () {
                  selectingIndex(5);
                },
              ),
            ],
          ),
          FSidebarGroup(
            label: const Text(
              'Account',
              style: TextStyle(decoration: TextDecoration.none),
            ),
            children: [
              FSidebarItem(
                icon: const Icon(FIcons.settings),
                label: const Text(
                  'Settings',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                selected: selectedIndex == 6,
                onPress: () {
                  selectingIndex(6);
                },
              ),
              FSidebarItem(
                icon: const Icon(FIcons.logOut),
                label: const Text(
                  'Log Out',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                selected: selectedIndex == 7,
                onPress: () {
                  selectingIndex(7);
                },
              ),
            ],
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          MediaQuery.sizeOf(context).width < 800 ? 8 : 16,
        ),
        child: IndexedStack(
          index: selectedIndex ?? 0,
          children: [
            MainDashboard(),
            RiwayatPresensi(),
            Lokasi(),
            Users(),
            Kelas(),
            Jadwal(),
            Settings(),
            LogOut(),
          ],
        ),
      ),
    );
  }
}
