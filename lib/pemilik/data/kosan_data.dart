import 'package:flutter/material.dart';

class DataKos {
  final String id;
  final String nama;
  final String alamat;
  final int jumlahKamar;
  final bool aktif;
  final List<Color> warna;

  const DataKos({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.jumlahKamar,
    required this.warna,
    this.aktif = true,
  });
}

class DataPenghuni {
  final String nama;
  final String idKos;
  final String kamar;
  final String status;

  const DataPenghuni({
    required this.nama,
    required this.idKos,
    required this.kamar,
    this.status = 'Aktif',
  });
}

const daftarKos = <DataKos>[
  DataKos(
    id: 'melati',
    nama: 'Kos Melati',
    alamat: 'Jl. Cempaka No. 10, Bandung',
    jumlahKamar: 8,
    warna: [Color(0xFFB7D7F5), Color(0xFFE8F2FF)],
  ),
  DataKos(
    id: 'harapan',
    nama: 'Kos Harapan',
    alamat: 'Jl. Mawar No. 8, Bandung',
    jumlahKamar: 6,
    warna: [Color(0xFFC8E1D1), Color(0xFFEDF7EF)],
  ),
  DataKos(
    id: 'sinar_baru',
    nama: 'Kos Sinar Baru',
    alamat: 'Jl. Anggrek No. 12, Bandung',
    jumlahKamar: 5,
    warna: [Color(0xFFE5D5B8), Color(0xFFFFF6E6)],
  ),
  DataKos(
    id: 'cemara',
    nama: 'Kos Cemara',
    alamat: 'Jl. Melati No. 5, Bandung',
    jumlahKamar: 4,
    aktif: false,
    warna: [Color(0xFFC9D5E7), Color(0xFFF0F4FA)],
  ),
];

const daftarPenghuni = <DataPenghuni>[
  DataPenghuni(nama: 'Budi Santoso', idKos: 'melati', kamar: 'A1'),
  DataPenghuni(nama: 'Siti Nurhaliza', idKos: 'harapan', kamar: 'B3'),
  DataPenghuni(nama: 'Andi Pratama', idKos: 'melati', kamar: 'A2'),
];

DataKos? cariKos(String id) {
  for (final kos in daftarKos) {
    if (kos.id == id) return kos;
  }
  return null;
}

List<DataPenghuni> penghuniUntukKos(String idKos) =>
    daftarPenghuni.where((penghuni) => penghuni.idKos == idKos).toList();

int jumlahPenghuniKos(String idKos) => penghuniUntukKos(idKos).length;
int jumlahKos() => daftarKos.length;
int jumlahKamar() => daftarKos.fold(0, (total, kos) => total + kos.jumlahKamar);
int jumlahPenghuni() => daftarPenghuni.length;
int jumlahPromosiAktif() => daftarKos.where((kos) => kos.aktif).length;
int jumlahPenghuniStatus(String status) =>
    daftarPenghuni.where((penghuni) => penghuni.status == status).length;

int jumlahKamarTerisi() => daftarPenghuni
    .map((penghuni) => '${penghuni.idKos}:${penghuni.kamar}')
    .toSet()
    .length;

int jumlahKamarKosong() => jumlahKamar() - jumlahKamarTerisi();
