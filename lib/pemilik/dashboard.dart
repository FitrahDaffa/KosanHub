import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Text('KosanHub'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Halo, Pemilik!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text('Berikut ringkasan kos Anda hari ini.'),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: SummaryCard(title: 'Total Kos', value: '2')),
              SizedBox(width: 10),
              Expanded(child: SummaryCard(title: 'Total Kamar', value: '20')),
            ],
          ),
          const Row(
            children: [
              Expanded(child: SummaryCard(title: 'Kamar Terisi', value: '15')),
              SizedBox(width: 10),
              Expanded(child: SummaryCard(title: 'Kamar Kosong', value: '5')),
            ],
          ),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
              title: Text('Pendapatan Bulan Ini'),
              subtitle: Text(
                'Rp 7.500.000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Text('+12%', style: TextStyle(color: Colors.green)),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Menu Utama',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MenuCard(title: 'Data Kos', icon: Icons.home),
              MenuCard(title: 'Data Kamar', icon: Icons.bed),
              MenuCard(title: 'Penghuni', icon: Icons.people),
              MenuCard(title: 'Pembayaran', icon: Icons.payment),
              MenuCard(title: 'Pemasaran', icon: Icons.campaign),
              MenuCard(title: 'Komplain', icon: Icons.chat),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Aktivitas Terbaru',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.payment, color: Colors.blue),
                  title: Text('Pembayaran Kamar A1'),
                  subtitle: Text('Budi Santoso · 2 jam lalu'),
                  trailing: Text('Rp 750.000'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Penghuni Baru'),
                  subtitle: Text('Siti Nurhaliza · Kamar B3'),
                  trailing: Text('Baru'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.apartment), label: 'Kos'),
          NavigationDestination(icon: Icon(Icons.campaign), label: 'Promosi'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Penghuni'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(height: 6),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
