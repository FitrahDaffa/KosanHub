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

  static const _routes = [
    '/pencari/dashboard', 
    '/pencari/favorit',   
    '/pencari/pesan',     
    '/pencari/pencarian', 
    '/pencari/profile',   
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        if (index == selectedIndex) return;
        
        if (index == 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur Pesan belum tersedia')),
          );
          return;
        }

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