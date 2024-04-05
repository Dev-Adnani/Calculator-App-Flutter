import 'package:calcu/core/adapters/hive_adapters.dart';
import 'package:calcu/app/providers/app_providers.dart';
import 'package:calcu/presentation/backdropScreen/backdrop_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  HiveAdapters.initialiseHive();
  HiveAdapters.registerAdapters();
  runApp(const Lava());
}

class Lava extends StatelessWidget {
  const Lava({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Core(),
    );
  }
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BackdropScreen(),
    );
  }
}
