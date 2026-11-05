import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pemilik/akun.dart';
import 'package:flutter_application_1/pemilik/dashboard.dart';
import 'package:flutter_application_1/pemilik/kos.dart';
import 'package:flutter_application_1/pemilik/pemasaran.dart';
import 'package:flutter_application_1/pemilik/penghuni.dart';
import 'package:flutter_application_1/pencariKosan/dashboard.dart';
import 'package:flutter_application_1/pencariKosan/favorit.dart';
import 'package:flutter_application_1/pencariKosan/pencarian.dart';
import 'package:flutter_application_1/pencariKosan/profile.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      routes: {
        '/pemilik/dashboard': (_) => const Dashboard(),
        '/pemilik/kos': (_) => const Kos(),
        '/pemilik/pemasaran': (_) => const Pemasaran(),
        '/pemilik/penghuni': (_) => const Penghuni(),
        '/pemilik/akun': (_) => const Akun(),

        '/pencari/dashboard': (context) => const DashboardPencariKosan(),
        '/pencari/favorit': (context) => const FavoritPencariKosan(),
        '/pencari/pencarian': (context) => const PencarianPage(),
        '/pencari/profile': (context) => const ProfilPencariKosan(),
      },
    );
  }
}
