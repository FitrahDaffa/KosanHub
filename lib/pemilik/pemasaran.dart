import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/akun.dart';
import 'package:flutter_application_1/pemilik/dashboard.dart';

class Pemasaran extends StatelessWidget {
  const Pemasaran({super.key});
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Text('Pemasaran'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performa Promosi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Data 7 hari terakhir'),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _Statistik(nilai: '2.483', label: 'Tayangan'),
                      _Statistik(nilai: '186', label: 'Klik'),
                      _Statistik(nilai: '47', label: 'Pesan'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.blue,
            child: ListTile(
              leading: const Icon(Icons.campaign, color: Colors.white),
              title: const Text(
                'Promosikan kos Anda',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Tambah'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Promosi Aktif',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const _KartuPromosi(
            nama: 'Kos Melati',
            alamat: 'Jl. Cempaka No. 10, Bandung',
            status: 'Aktif',
            warnaStatus: Colors.green,
          ),
          const _KartuPromosi(
            nama: 'Kos Harapan',
            alamat: 'Jl. Mawar No. 8, Bandung',
            status: 'Aktif',
            warnaStatus: Colors.green,
          ),
          const SizedBox(height: 12),
          const Text(
            'Promosi Nonaktif',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const _KartuPromosi(
            nama: 'Kos Sinar Baru',
            alamat: 'Jl. Anggrek No. 12, Bandung',
            status: 'Nonaktif',
            warnaStatus: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }else if(index == 4){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Akun()),
            );
          }
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

class _Statistik extends StatelessWidget {
  final String nilai;
  final String label;

  const _Statistik({required this.nilai, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(nilai, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}

class _KartuPromosi extends StatelessWidget {
  final String nama;
  final String alamat;
  final String status;
  final Color warnaStatus;

  const _KartuPromosi({
    required this.nama,
    required this.alamat,
    required this.status,
    required this.warnaStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: const Icon(Icons.home_work, color: Colors.blue),
        title: Text(nama),
        subtitle: Text(alamat),
        trailing: Text(
          status,
          style: TextStyle(color: warnaStatus, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
