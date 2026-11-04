import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';
import 'package:flutter_application_1/pemilik/pemilik_navigation_bar.dart';
import 'package:flutter_application_1/pemilik/penghuni.dart';
import 'package:flutter_application_1/pemilik/widgets/kos_card.dart';
import 'package:flutter_application_1/pemilik/widgets/tenant_summary.dart';

class Kos extends StatefulWidget {
  const Kos({super.key});

  @override
  State<Kos> createState() => _KosState();
}

class _KosState extends State<Kos> {
  final _searchController = TextEditingController();
  String _query = '';

  List<DataKos> get _filteredKos => daftarKos
      .where(
        (kos) =>
            kos.nama.toLowerCase().contains(_query) ||
            kos.alamat.toLowerCase().contains(_query),
      )
      .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PemilikScaffold(
      selectedIndex: 1,
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Text('Daftar Kos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          const TenantSummary(),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final title = const Text(
                'Daftar Kos',
                style: TextStyle(
                  color: Color(0xFF123A83),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
              final search = _buildSearchField();

              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    title,
                    const Spacer(),
                    SizedBox(width: 330, child: search),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, const SizedBox(height: 10), search],
              );
            },
          ),
          const SizedBox(height: 12),
          if (_filteredKos.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 36),
              child: Center(child: Text('Kos tidak ditemukan.')),
            )
          else
            ..._filteredKos.map(
              (kos) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: KosCard(
                  kos: kos,
                  onViewTenants: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Penghuni(idKos: kos.id)),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 4),
          const GroupChatCard(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
      decoration: InputDecoration(
        hintText: 'Cari nama kos...',
        prefixIcon: const Icon(Icons.search, color: Color(0xFF748AB4)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFFD9E8FF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
