import 'package:flutter/material.dart';

class PencariScaffold extends StatelessWidget {
  final int selectedIndex;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const PencariScaffold({
    super.key,
    required this.selectedIndex,
    required this.body,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      bottomNavigationBar: PencariNavigationBar(selectedIndex: selectedIndex),
    );
  }
}

class PencariNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const PencariNavigationBar({super.key, required this.selectedIndex});

  // Rute ini disesuaikan dengan file kamu, Jojo, dan Radi
  static const _routes = [
    '/pencari/dashboard', // Index 0: dashboard.dart
    '/pencari/favorit',   // Index 1: favorit.dart
    '/pencari/pesan',     // Index 2: (File pesan belum ada)
    '/pencari/pencarian', // Index 3: pencarian.dart (Jojo)
    '/pencari/profile',   // Index 4: profile.dart (Radi)
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        // Biar nggak error kalau ngeklik tombol yang lagi aktif
        if (index == selectedIndex) return;
        
        // Pengecualian sementara buat fitur Pesan karena filenya belum ada
        if (index == 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur Pesan belum tersedia')),
          );
          return;
        }

        // Pindah halaman sesuai rute
        Navigator.pushReplacementNamed(context, _routes[index]);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
        NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorit'),
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Pesan'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Cari'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}