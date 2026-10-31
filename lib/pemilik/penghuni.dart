import 'package:flutter/material.dart';

class Penghuni extends StatelessWidget {
  const Penghuni({super.key});

  static const _dataPenghuni = [
    ('Budi Santoso', 'Kos Melati | Kamar A1', 'Aktif'),
    ('Siti Nurhaliza', 'Kos Mawar | Kamar B3', 'Aktif'),
    ('Andi Pratama', 'Kos Melati | Kamar A2', 'Aktif'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Daftar Penghuni',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Text('Informasi penghuni kos Anda.'),
        const SizedBox(height: 16),
        ..._dataPenghuni.map(
          (penghuni) => Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE7F0FF),
                child: Icon(Icons.person, color: Colors.blue),
              ),
              title: Text(penghuni.$1),
              subtitle: Text(penghuni.$2),
              trailing: Text(
                penghuni.$3,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
