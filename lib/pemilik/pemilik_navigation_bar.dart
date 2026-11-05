import 'package:flutter/material.dart';

class PemilikScaffold extends StatelessWidget {
  final int selectedIndex;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const PemilikScaffold({
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
      bottomNavigationBar: PemilikNavigationBar(selectedIndex: selectedIndex),
    );
  }
}

class PemilikNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const PemilikNavigationBar({super.key, required this.selectedIndex});

  static const _routes = [
    '/pemilik/dashboard',
    '/pemilik/kos',
    '/pemilik/pemasaran',
    '/pemilik/penghuni',
    '/pemilik/akun',
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        if (index == selectedIndex) return;
        Navigator.pushReplacementNamed(context, _routes[index]);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
        NavigationDestination(icon: Icon(Icons.apartment), label: 'Kos'),
        NavigationDestination(icon: Icon(Icons.campaign), label: 'Promosi'),
        NavigationDestination(icon: Icon(Icons.people), label: 'Penghuni'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Akun'),
      ],
    );
  }
}
