import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';
import 'package:flutter_application_1/pemilik/pemilik_navigation_bar.dart';

class Penghuni extends StatelessWidget {
  final String? idKos;

  const Penghuni({super.key, this.idKos});

  @override
  Widget build(BuildContext context) {
    final kosDipilih = idKos == null ? null : cariKos(idKos!);
    final dataPenghuni = idKos == null ? daftarPenghuni : penghuniUntukKos(idKos!);

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
          if (idKos == null)
            ...daftarKos.map((kos) {
              final penghuniKos = penghuniUntukKos(kos.id);
              return _BagianKos(kos: kos, penghuni: penghuniKos);
            })
          else if (dataPenghuni.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: Text('Belum ada penghuni di kos ini.')),
            ),
          if (idKos != null)
            ...dataPenghuni.map((penghuni) => _BarisPenghuni(penghuni: penghuni)),
        ],
      ),
    );
  }
}

class _BagianKos extends StatelessWidget {
  final DataKos kos;
  final List<DataPenghuni> penghuni;

  const _BagianKos({required this.kos, required this.penghuni});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.apartment, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    kos.nama,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('${penghuni.length} orang'),
              ],
            ),
          ),
          if (penghuni.isEmpty)
            const ListTile(title: Text('Belum ada penghuni.'))
          else
            ...penghuni.map((orang) => _BarisPenghuni(penghuni: orang)),
        ],
      ),
    );
  }
}

class _BarisPenghuni extends StatelessWidget {
  final DataPenghuni penghuni;

  const _BarisPenghuni({required this.penghuni});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFE7F0FF),
        child: Icon(Icons.person, color: Colors.blue),
      ),
      title: Text(penghuni.nama),
      subtitle: Text('Kamar ${penghuni.kamar}'),
      trailing: Text(
        penghuni.status,
        style: TextStyle(
          color: penghuni.status == 'Aktif' ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
