import 'package:flutter/material.dart';
import 'pencari_navigation_bar.dart'; // Import kerangka navigasi

class FavoritPencariKosan extends StatelessWidget {
  const FavoritPencariKosan({super.key});

  @override
  Widget build(BuildContext context) {
    return PencariScaffold(
      selectedIndex: 1, // Index 1 untuk menu Favorit
      backgroundColor: const Color(0xFFF3F4F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
                  decoration: const BoxDecoration(
                    color: Color(0xFF2F80ED),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.arrow_back, color: Colors.white),
                              SizedBox(width: 12),
                              Text('Favorit', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Icon(Icons.notifications_none, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(left: 36),
                        child: Text('Kos yang sudah kamu simpan', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                // Info Box
                Positioned(
                  bottom: -20, left: 20, right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: const Color(0xFF2F80ED), borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.bookmark, color: Colors.white, size: 16),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('3 Kos Favorit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            Text('Simpan kos favoritmu dan jangan sampai kehabisan!', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),

            // Daftar Favorit
            _buildFavCard('Kos Melati', 'Jl. Cempaka No. 10, Bandung', 'Rp 750.000', '4.8', ['WiFi', 'AC', 'Dapur', 'Parkir']),
            _buildFavCard('Kos Harapan', 'Jl. Mawar No. 8, Bandung', 'Rp 700.000', '4.5', ['WiFi', 'AC', 'Parkir', 'Laundry']),
            const SizedBox(height: 10),
            
            const Center(
              child: Text('♡ Hapus dari favorit', style: TextStyle(color: Colors.grey, fontSize: 10)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFavCard(String name, String address, String price, String rating, List<String> facilities) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 100, height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
                    child: Text('★ $rating', style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(address, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(price, style: const TextStyle(color: Color(0xFF2F80ED), fontWeight: FontWeight.bold, fontSize: 14)),
                        const Text(' / bulan', style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      children: facilities.map((f) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.blue.shade100)
                        ),
                        child: Text(f, style: const TextStyle(color: Color(0xFF2F80ED), fontSize: 8)),
                      )).toList(),
                    )
                  ],
                ),
                const Positioned(
                  top: 0, right: 0,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}