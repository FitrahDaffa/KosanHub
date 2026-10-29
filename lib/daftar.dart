import 'package:flutter/material.dart';

class daftar extends StatefulWidget {
  const daftar({super.key});

  @override
  State<daftar> createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.home,
              size: 80,
              color: Colors.white
            )
          ],
        ),
      ),
    );
  }
}