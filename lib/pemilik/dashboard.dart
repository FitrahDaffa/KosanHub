import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const new({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KosanHub'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Halo, pemilik',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('berikut ringkasan kos anda hari ini.'),
            const SizedBox(height: 20),
            const Row(
              children: [
                
              ],
            )

        ],
      ),

    );
  }
}