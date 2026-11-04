import 'package:flutter/material.dart';

import 'kos_item.dart';

class PenghuniItem {
  final String name;
  final String kosId;
  final String room;
  final String status;

  const PenghuniItem({
    required this.name,
    required this.kosId,
    required this.room,
    required this.status,
  });
}

/// Sumber data yang dipakai bersama oleh halaman Kos dan Penghuni.
class PemilikData {
  static const kos = <KosItem>[
    KosItem(id: 'melati', name: 'Kos Melati', address: 'Jl. Cempaka No. 10, Bandung', rooms: 8, colors: [Color(0xFFB7D7F5), Color(0xFFE8F2FF)]),
    KosItem(id: 'harapan', name: 'Kos Harapan', address: 'Jl. Mawar No. 8, Bandung', rooms: 6, colors: [Color(0xFFC8E1D1), Color(0xFFEDF7EF)]),
    KosItem(id: 'sinar-baru', name: 'Kos Sinar Baru', address: 'Jl. Anggrek No. 12, Bandung', rooms: 5, colors: [Color(0xFFE5D5B8), Color(0xFFFFF6E6)]),
    KosItem(id: 'cemara', name: 'Kos Cemara', address: 'Jl. Melati No. 5, Bandung', rooms: 4, active: false, colors: [Color(0xFFC9D5E7), Color(0xFFF0F4FA)]),
  ];

  static const penghuni = <PenghuniItem>[
    PenghuniItem(name: 'Budi Santoso', kosId: 'melati', room: 'A1', status: 'Aktif'),
    PenghuniItem(name: 'Siti Nurhaliza', kosId: 'harapan', room: 'B3', status: 'Aktif'),
    PenghuniItem(name: 'Andi Pratama', kosId: 'melati', room: 'A2', status: 'Aktif'),
  ];

  static List<PenghuniItem> penghuniUntuk(String kosId) =>
      penghuni.where((item) => item.kosId == kosId).toList();

  static KosItem? kosUntuk(String kosId) {
    for (final item in kos) {
      if (item.id == kosId) return item;
    }
    return null;
  }
}
