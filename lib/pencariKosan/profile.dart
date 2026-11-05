import 'package:flutter/material.dart';

class ProfilPencariKosan extends StatefulWidget {
  const ProfilPencariKosan({super.key});

  @override
  State<ProfilPencariKosan> createState() => _ProfilPencariKosanState();
}

class _ProfilPencariKosanState extends State<ProfilPencariKosan> {
  final Color biru = const Color(0xFF2879E8);
  final Color background = const Color(0xFFF3F7FF);

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  Widget menuItem(IconData icon, String judul, String deskripsi) {
    return InkWell(
      onTap: () => tampilkanPesan('$judul dipilih'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFFF0F5FF),
              child: Icon(icon, color: const Color(0xFF263B70), size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF101F50),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    deskripsi,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8998B5),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF8998B5)),
          ],
        ),
      ),
    );
  }

  Widget statistik(IconData icon, String angka, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: biru, size: 30),
          const SizedBox(height: 8),
          Text(
            angka,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF101F50),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF7585A5)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [biru, const Color(0xFF438FF0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              padding: const EdgeInsets.only(top: 55, left: 24),
              alignment: Alignment.topLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kelola akun dan pengaturan Anda',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 130,
                left: 20,
                right: 20,
                bottom: 25,
              ),
              child: Column(
                children: [
                  // Kartu Profil
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 43,
                              backgroundColor: const Color(0xFFE7F1FF),
                              child: Icon(Icons.person, size: 55, color: biru),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daffa',
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF101F50),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'daffa@gmail.com',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF8291AF),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Pencari Kos',
                                    style: TextStyle(
                                      color: Color(0xFF2879E8),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  tampilkanPesan('Edit profil dipilih'),
                              icon: Icon(Icons.edit, color: biru),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFEAF3FF),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F6FF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              statistik(
                                Icons.favorite_border,
                                '3',
                                'Kos Favorit',
                              ),
                              statistik(
                                Icons.chat_bubble_outline,
                                '5',
                                'Pesan',
                              ),
                              statistik(Icons.history, '2', 'Riwayat Booking'),
                              statistik(Icons.star_border, '0', 'Ulasan'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Menu Profil
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        menuItem(
                          Icons.favorite_border,
                          'Favorit',
                          'Kos yang disimpan',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        menuItem(
                          Icons.chat_bubble_outline,
                          'Pesan',
                          'Riwayat chat',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        menuItem(
                          Icons.access_time,
                          'Riwayat Pencarian',
                          'Kos yang pernah dilihat',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        menuItem(
                          Icons.notifications_none,
                          'Notifikasi',
                          'Info terbaru dan pengingat',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        menuItem(
                          Icons.settings_outlined,
                          'Pengaturan',
                          'Akun, privasi, dan preferensi',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        menuItem(
                          Icons.help_outline,
                          'Bantuan',
                          'FAQ dan panduan',
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Color(0xFFF0F5FF),
                                  child: Icon(
                                    Icons.logout,
                                    color: Color(0xFF263B70),
                                    size: 26,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Keluar',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF101F50),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Keluar dari akun',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF8998B5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF8998B5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Banner Cari Kos
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.home_work_outlined, size: 55, color: biru),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Masih mencari kos yang cocok?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF10265C),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Gunakan filter pencarian untuk menemukan kos sesuai kebutuhanmu!',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8295B8),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () =>
                                    tampilkanPesan('Membuka pencarian kos'),
                                icon: const Icon(Icons.search, size: 18),
                                label: const Text('Cari Kos'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: 4,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFEAF3FF),
        onDestinationSelected: (index) {
          if (index != 4) {
            tampilkanPesan('Halaman belum tersedia');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Pesan',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Pencarian'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
