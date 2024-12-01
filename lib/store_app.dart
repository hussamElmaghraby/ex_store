import 'package:ex_app/core/app/connectivity_controller.dart';
import 'package:ex_app/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            theme: ThemeData(),
            home: const Scaffold(),
            builder: (_, widget) {
              return Scaffold(
                body: Builder(builder: (_) {
                  ConnectivityController.instance.init();
                  return widget!;
                }),
              );
            },
          );
        } else {
          return MaterialApp(
            theme: ThemeData(),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
