import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';
import 'package:flutter_application_1/pemilik/pemilik_navigation_bar.dart';

class Pemasaran extends StatelessWidget {
  const Pemasaran({super.key});
  @override
  Widget build(BuildContext context) {
    return PemilikScaffold(
      selectedIndex: 2,
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
          ...daftarKos
              .where((kos) => kos.aktif)
              .map(
                (kos) => _KartuPromosi(
                  nama: kos.nama,
                  alamat: kos.alamat,
                  status: 'Aktif',
                  warnaStatus: Colors.green,
                ),
              ),
          const SizedBox(height: 12),
          const Text(
            'Promosi Nonaktif',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...daftarKos
              .where((kos) => !kos.aktif)
              .map(
                (kos) => _KartuPromosi(
                  nama: kos.nama,
                  alamat: kos.alamat,
                  status: 'Nonaktif',
                  warnaStatus: Colors.grey,
                ),
              ),
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
