
import 'package:flutter/material.dart';
import 'kosan_data.dart';

class KosCard extends StatelessWidget {
  final KosModel kos;

  const KosCard({
    super.key,
    required this.kos,
  });

  @override
  Widget build(BuildContext context) {
    const biru = Color(0xFF2580F5);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5EDF8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              kos.gambar,
              width: 115,
              height: 125,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 115,
                  height: 125,
                  color: const Color(0xFFE5EFFB),
                  child: const Icon(
                    Icons.home,
                    size: 40,
                    color: biru,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kos.nama,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF172B59),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 13,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        kos.alamat,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  '${formatRupiah(kos.harga)} / bulan',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: biru,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: kos.fasilitas.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF3FF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 9,
                          color: biru,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      Icons.bed,
                      size: 13,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${kos.jumlahKamar} Kamar',
                      style: const TextStyle(fontSize: 9),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.people,
                      size: 13,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${kos.jumlahPenghuni} Penghuni',
                      style: const TextStyle(fontSize: 9),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: kos.status == 'Tersedia'
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      kos.status,
                      style: TextStyle(
                        fontSize: 10,
                        color: kos.status == 'Tersedia'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
