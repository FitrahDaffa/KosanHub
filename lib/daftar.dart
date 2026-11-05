import 'package:flutter/material.dart';

class daftar extends StatefulWidget {
  const daftar({super.key});

  @override
  State<daftar> createState() => _DaftarState();
}

class _DaftarState extends State<daftar> {
  bool pemilik = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF68A7F5), Color(0xFF347FEA)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              const Icon(Icons.home_work, color: Colors.white, size: 55),
              const Text(
                'KosanHub',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              const Text(
                'Daftar akun untuk mulai menggunakan aplikasi',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: ListView(
                    children: [
                      for (final item in [
                        ['Nama Lengkap', Icons.person_outline],
                        ['Email', Icons.email_outlined],
                        ['Nomor HP', Icons.phone_outlined],
                        ['Password', Icons.lock_outline],
                        ['Konfirmasi Password', Icons.lock_outline],
                      ])
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TextField(
                            obscureText: item[0].toString().contains(
                              'Password',
                            ),
                            decoration: InputDecoration(
                              hintText: item[0] as String,
                              prefixIcon: Icon(item[1] as IconData),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      const Text(
                        'Pilih Peran Anda',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RadioListTile<bool>(
                        value: true,
                        groupValue: pemilik,
                        title: const Text('Pemilik Kos'),
                        onChanged: (value) => setState(() => pemilik = value!),
                      ),
                      RadioListTile<bool>(
                        value: false,
                        groupValue: pemilik,
                        title: const Text('Pencari Kos'),
                        onChanged: (value) => setState(() => pemilik = value!),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Daftar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Sudah punya akun? Login di sini'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
