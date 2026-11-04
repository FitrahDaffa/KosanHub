import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';
import 'package:flutter_application_1/pemilik/pemilik_navigation_bar.dart';

class Penghuni extends StatelessWidget {
  final String? idKos;

  const Penghuni({super.key, this.idKos});

  @override
  Widget build(BuildContext context) {
    final dataPenghuni = idKos == null
        ? daftarPenghuni
        : penghuniUntukKos(idKos!);
    final kosDipilih = idKos == null ? null : cariKos(idKos!);

    return PemilikScaffold(
      selectedIndex: 3,
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: Text(
          kosDipilih == null ? 'Penghuni' : 'Penghuni ${kosDipilih.nama}',
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Daftar Penghuni',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text('Informasi penghuni kos Anda.'),
          const SizedBox(height: 16),
          if (dataPenghuni.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: Text('Belum ada penghuni di kos ini.')),
            ),
          ...dataPenghuni.map(
            (penghuni) => Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE7F0FF),
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                title: Text(penghuni.nama),
                subtitle: Text(
                  '${cariKos(penghuni.idKos)?.nama ?? 'Kos tidak ditemukan'} | Kamar ${penghuni.kamar}',
                ),
                trailing: Text(
                  penghuni.status,
                  style: TextStyle(
                    color: penghuni.status == 'Aktif'
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
