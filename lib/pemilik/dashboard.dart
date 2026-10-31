import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';
import 'package:flutter_application_1/pemilik/pemilik_navigation_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return PemilikScaffold(
      selectedIndex: 0,
      backgroundColor: Colors.white,
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
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  title: 'Total Kos',
                  value: '${jumlahKos()}',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SummaryCard(
                  title: 'Total Kamar',
                  value: '${jumlahKamar()}',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  title: 'Kamar Terisi',
                  value: '${jumlahKamarTerisi()}',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SummaryCard(
                  title: 'Kamar Kosong',
                  value: '${jumlahKamarKosong()}',
                ),
              ),
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
          const SizedBox(height: 8),
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
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({super.key, required this.title, required this.value});

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
  final VoidCallback? onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}
