import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pemilik/akun.dart';
import 'package:flutter_application_1/pemilik/dashboard.dart';
import 'package:flutter_application_1/pemilik/kos.dart';
import 'package:flutter_application_1/pemilik/pemasaran.dart';
import 'package:flutter_application_1/pemilik/penghuni.dart';

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
      },
    );
  }
}
