import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/akun.dart';
import 'package:flutter_application_1/pemilik/dashboard.dart';
import 'package:flutter_application_1/pemilik/pemasaran.dart';
class Akun extends StatelessWidget {
  const Akun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Akun'),
            Text(
              'Kelola akun dan pengaturan kos Anda.',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person, size: 36),
              ),
              title: const Text(
                'Budi Santoso',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('budi.santoso@example.com'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan Akun',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      _Ringkasan(icon: Icons.home, angka: '4', label: 'Kos'),
                      _Ringkasan(icon: Icons.people, angka: '24', label: 'Penghuni'),
                      _Ringkasan(icon: Icons.message, angka: '12', label: 'Pesan'),
                      _Ringkasan(icon: Icons.campaign, angka: '3', label: 'Promosi'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: const [
                _MenuAkun(icon: Icons.person, judul: 'Informasi Akun'),
                Divider(height: 1),
                _MenuAkun(icon: Icons.security, judul: 'Keamanan'),
                Divider(height: 1),
                _MenuAkun(icon: Icons.notifications, judul: 'Pengaturan Notifikasi'),
                Divider(height: 1),
                _MenuAkun(icon: Icons.help, judul: 'Bantuan & Panduan'),
                Divider(height: 1),
                _MenuAkun(icon: Icons.description, judul: 'Kebijakan & Privasi'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Keluar Akun', style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }else if(index == 4){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pemasaran()),
            );
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Penghuni'),
          NavigationDestination(icon: Icon(Icons.campaign), label: 'Pemasaran'),
          NavigationDestination(icon: Icon(Icons.apartment), label: 'Kos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class _Ringkasan extends StatelessWidget {
  final IconData icon;
  final String angka;
  final String label;

  const _Ringkasan({
    required this.icon,
    required this.angka,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 6),
          Text(angka, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}

class _MenuAkun extends StatelessWidget {
  final IconData icon;
  final String judul;

  const _MenuAkun({required this.icon, required this.judul});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(judul),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
