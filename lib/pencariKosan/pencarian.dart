
import 'package:flutter/material.dart';
import 'kosan_data.dart';
import 'kos_card.dart';

class PencarianPage extends StatefulWidget {
  const PencarianPage({super.key});

  @override
  State<PencarianPage> createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
  final TextEditingController searchController =
      TextEditingController();

  String lokasi = 'Semua Lokasi';
  String harga = 'Semua Harga';
  String tipe = 'Semua Tipe';
  String fasilitas = 'Semua Fasilitas';
  String urutan = 'Relevansi';

  List<KosModel> get hasilPencarian {
    final keyword = searchController.text.toLowerCase();

    final hasil = daftarKos.where((kos) {
      final cocokKeyword =
          kos.nama.toLowerCase().contains(keyword) ||
          kos.alamat.toLowerCase().contains(keyword) ||
          kos.lokasi.toLowerCase().contains(keyword) ||
          kos.fasilitas.any(
            (item) => item.toLowerCase().contains(keyword),
          );

      final cocokLokasi =
          lokasi == 'Semua Lokasi' || kos.lokasi == lokasi;

      final cocokHarga =
          harga == 'Semua Harga' ||
          (harga == 'Di bawah Rp700 ribu' && kos.harga < 700000) ||
          (harga == 'Rp700-800 ribu' &&
              kos.harga >= 700000 &&
              kos.harga <= 800000) ||
          (harga == 'Di atas Rp800 ribu' && kos.harga > 800000);

      final cocokTipe =
          tipe == 'Semua Tipe' || kos.tipeKamar == tipe;

      final cocokFasilitas =
          fasilitas == 'Semua Fasilitas' ||
          kos.fasilitas.contains(fasilitas);

      return cocokKeyword &&
          cocokLokasi &&
          cocokHarga &&
          cocokTipe &&
          cocokFasilitas;
    }).toList();

    if (urutan == 'Harga Terendah') {
      hasil.sort((a, b) => a.harga.compareTo(b.harga));
    } else if (urutan == 'Harga Tertinggi') {
      hasil.sort((a, b) => b.harga.compareTo(a.harga));
    } else if (urutan == 'Rating Tertinggi') {
      hasil.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return hasil;
  }

  Widget filterDropdown({
    required String value,
    required List<String> pilihan,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFDCE7F5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          items: pilihan.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 10),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
      ),
    );
  }

  void resetFilter() {
    setState(() {
      searchController.clear();
      lokasi = 'Semua Lokasi';
      harga = 'Semua Harga';
      tipe = 'Semua Tipe';
      fasilitas = 'Semua Fasilitas';
      urutan = 'Relevansi';
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasil = hasilPencarian;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FD),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
              decoration: const BoxDecoration(
                color: Color(0xFF2580F5),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pencarian Kos',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Temukan kos yang sesuai dengan kebutuhanmu!',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 17),
                  TextField(
                    controller: searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Cari nama kos atau lokasi...',
                      hintStyle: const TextStyle(fontSize: 11),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(14, 15, 14, 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_list,
                    color: Color(0xFF2580F5),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Filter Pencarian',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: resetFilter,
                    child: const Text(
                      'Reset Filter',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  filterDropdown(
                    value: lokasi,
                    pilihan: ['Semua Lokasi', 'Bandung'],
                    onChanged: (value) {
                      setState(() => lokasi = value);
                    },
                  ),
                  const SizedBox(width: 7),
                  filterDropdown(
                    value: harga,
                    pilihan: [
                      'Semua Harga',
                      'Di bawah Rp700 ribu',
                      'Rp700-800 ribu',
                      'Di atas Rp800 ribu',
                    ],
                    onChanged: (value) {
                      setState(() => harga = value);
                    },
                  ),
                  const SizedBox(width: 7),
                  filterDropdown(
                    value: tipe,
                    pilihan: [
                      'Semua Tipe',
                      'Putra',
                      'Putri',
                      'Campur',
                    ],
                    onChanged: (value) {
                      setState(() => tipe = value);
                    },
                  ),
                  const SizedBox(width: 7),
                  filterDropdown(
                    value: fasilitas,
                    pilihan: [
                      'Semua Fasilitas',
                      'WiFi',
                      'AC',
                      'Dapur',
                      'Parkir',
                      'Laundry',
                    ],
                    onChanged: (value) {
                      setState(() => fasilitas = value);
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
              child: Row(
                children: [
                  const Text(
                    'Urutkan:',
                    style: TextStyle(fontSize: 11),
                  ),
                  const SizedBox(width: 5),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: urutan,
                      isDense: true,
                      items: [
                        'Relevansi',
                        'Harga Terendah',
                        'Harga Tertinggi',
                        'Rating Tertinggi',
                      ].map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => urutan = value);
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${hasil.length} kos ditemukan',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: hasil.isEmpty
                  ? const Center(
                      child: Text(
                        'Kos tidak ditemukan',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: hasil.length,
                      itemBuilder: (context, index) {
                        return KosCard(kos: hasil[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
