import 'package:flutter/material.dart';

import 'pemilik_data.dart';

class Penghuni extends StatelessWidget {
  const Penghuni({super.key});

  @override
  Widget build(BuildContext context) {
    final penghuni = PemilikData.penghuni;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Daftar Penghuni', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Informasi penghuni kos Anda.'),
        const SizedBox(height: 16),
        if (penghuni.isEmpty)
          const Card(child: ListTile(title: Text('Belum ada data penghuni.')))
        else
          ...penghuni.map((item) {
            final kos = PemilikData.kosUntuk(item.kosId);
            return Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE7F0FF),
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                title: Text(item.name),
                subtitle: Text('${kos?.name ?? 'Kos tidak ditemukan'} | Kamar ${item.room}'),
                trailing: Text(
                  item.status,
                  style: TextStyle(color: item.status == 'Aktif' ? Colors.green : Colors.orange),
                ),
              ),
            );
          }),
      ],
    );
  }
}
