import 'package:ex_app/core/common/widgets/admin_app_bar.dart';
import 'package:ex_app/core/style/colors/colors_dark.dart';
import 'package:ex_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget page = const DashboardScreen();
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (_) => const MainAdminScreen(),
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(
        0.6,
      ),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MainAdminScreen extends StatelessWidget {
  const MainAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: AdminAppBar(
        isMain: false,
        backgroundColor: ColorsDark.blueDark,
        title: 'Ex Store',
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
