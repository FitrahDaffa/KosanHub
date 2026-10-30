import 'package:flutter/material.dart';

class DashboardPencariKosan extends StatelessWidget {
  const DashboardPencariKosan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Pencari Kos')),
      body: const Center(
        child: Text('Selamat datang, Rama!'),
      ),
    );
  }
}
