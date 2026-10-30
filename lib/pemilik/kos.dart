import 'package:flutter/material.dart';

class Kos extends StatefulWidget {
  final VoidCallback? onOpenPenghuni;

  const Kos({super.key, this.onOpenPenghuni});

  @override
  State<Kos> createState() => _KosState();
}

class _KosState extends State<Kos> {
  final _searchController = TextEditingController();
  String _query = '';

  static const _dataKos = [
    _KosItem(
      name: 'Kos Melati',
      address: 'Jl. Cempaka No. 10, Bandung',
      rooms: 8,
      tenants: 8,
      colors: [Color(0xFFB7D7F5), Color(0xFFE8F2FF)],
    ),
    _KosItem(
      name: 'Kos Harapan',
      address: 'Jl. Mawar No. 8, Bandung',
      rooms: 6,
      tenants: 6,
      colors: [Color(0xFFC8E1D1), Color(0xFFEDF7EF)],
    ),
    _KosItem(
      name: 'Kos Sinar Baru',
      address: 'Jl. Anggrek No. 12, Bandung',
      rooms: 5,
      tenants: 5,
      colors: [Color(0xFFE5D5B8), Color(0xFFFFF6E6)],
    ),
    _KosItem(
      name: 'Kos Cemara',
      address: 'Jl. Melati No. 5, Bandung',
      rooms: 4,
      tenants: 4,
      active: false,
      colors: [Color(0xFFC9D5E7), Color(0xFFF0F4FA)],
    ),
  ];

  List<_KosItem> get _filteredKos => _dataKos
      .where(
        (kos) =>
            kos.name.toLowerCase().contains(_query) ||
            kos.address.toLowerCase().contains(_query),
      )
      .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        const _TenantSummary(),
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
              child: _KosCard(kos: kos, onViewTenants: widget.onOpenPenghuni),
            ),
          ),
        const SizedBox(height: 4),
        const _GroupChatCard(),
      ],
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

class _TenantSummary extends StatelessWidget {
  const _TenantSummary();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFDCEAFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final summary = Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFE5F0FF),
                  child: Icon(
                    Icons.groups_rounded,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Penghuni',
                        style: TextStyle(
                          color: Color(0xFF123A83),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '24 Orang',
                        style: TextStyle(
                          color: Color(0xFF123A83),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'dari 4 kos yang Anda kelola',
                        style: TextStyle(
                          color: Color(0xFF7187B2),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            const statuses = Row(
              children: [
                Expanded(
                  child: _StatusCard(
                    label: 'Tinggal',
                    count: '21',
                    color: Color(0xFF16B878),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _StatusCard(
                    label: 'Cuti',
                    count: '2',
                    color: Color(0xFFFFB51B),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _StatusCard(
                    label: 'Keluar',
                    count: '1',
                    color: Color(0xFFF04444),
                  ),
                ),
              ],
            );

            if (constraints.maxWidth > 650) {
              return Row(
                children: [
                  Expanded(flex: 5, child: summary),
                  const SizedBox(width: 16),
                  const SizedBox(
                    height: 82,
                    child: VerticalDivider(color: Color(0xFFDCE8FA)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(flex: 6, child: statuses),
                ],
              );
            }

            return Column(
              children: [
                summary,
                const SizedBox(height: 14),
                const Divider(height: 1, color: Color(0xFFE4ECF8)),
                const SizedBox(height: 12),
                statuses,
              ],
            );
          },
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const _StatusCard({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 11, color: color),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF627AA9),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              const Icon(Icons.person, size: 17, color: Colors.blue),
              const SizedBox(width: 6),
              Text(
                count,
                style: const TextStyle(
                  color: Color(0xFF123A83),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KosCard extends StatelessWidget {
  final _KosItem kos;
  final VoidCallback? onViewTenants;

  const _KosCard({required this.kos, required this.onViewTenants});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Color(0xFFDCEAFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 650;
            final information = Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _KosIllustration(colors: kos.colors),
                const SizedBox(width: 12),
                Expanded(child: _KosInformation(kos: kos)),
                PopupMenuButton<String>(
                  tooltip: 'Opsi ${kos.name}',
                  icon: const Icon(Icons.more_vert, color: Color(0xFF7187B2)),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'detail', child: Text('Detail kos')),
                    PopupMenuItem(value: 'edit', child: Text('Edit kos')),
                  ],
                  onSelected: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$value: ${kos.name}')),
                    );
                  },
                ),
              ],
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (wide)
                  Row(
                    children: [
                      Expanded(child: information),
                      const SizedBox(width: 8),
                      _ChatButton(active: kos.active),
                    ],
                  )
                else ...[
                  information,
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _ChatButton(active: kos.active),
                  ),
                ],
                const SizedBox(height: 10),
                const Divider(height: 1, color: Color(0xFFE4ECF8)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _TenantAvatarStack(count: kos.tenants),
                    const Spacer(),
                    TextButton(
                      onPressed: onViewTenants,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF0878F9),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Lihat Semua Penghuni'),
                          SizedBox(width: 4),
                          Icon(Icons.chevron_right, size: 21),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _KosInformation extends StatelessWidget {
  final _KosItem kos;

  const _KosInformation({required this.kos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Text(
              kos.name,
              style: const TextStyle(
                color: Color(0xFF123A83),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: kos.active
                    ? const Color(0xFFE1F7EC)
                    : const Color(0xFFEBF0F8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                kos.active ? 'Aktif' : 'Tidak Aktif',
                style: TextStyle(
                  color: kos.active
                      ? const Color(0xFF169B64)
                      : const Color(0xFF7187B2),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            const Icon(Icons.location_on, size: 17, color: Color(0xFF7187B2)),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                kos.address,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF7187B2), fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          children: [
            _InfoMetric(icon: Icons.calendar_month, text: '${kos.rooms} Kamar'),
            _InfoMetric(
              icon: Icons.groups_rounded,
              text: '${kos.tenants} Penghuni',
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoMetric extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoMetric({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 17, color: const Color(0xFF7187B2)),
      const SizedBox(width: 5),
      Text(
        text,
        style: const TextStyle(color: Color(0xFF7187B2), fontSize: 12),
      ),
    ],
  );
}

class _KosIllustration extends StatelessWidget {
  final List<Color> colors;

  const _KosIllustration({required this.colors});

  @override
  Widget build(BuildContext context) => Container(
    width: 82,
    height: 82,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Icon(Icons.apartment_rounded, color: Colors.white, size: 42),
  );
}

class _ChatButton extends StatelessWidget {
  final bool active;

  const _ChatButton({required this.active});

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: active
        ? () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur chat grup belum tersedia.')),
          )
        : null,
    icon: const Icon(Icons.chat_bubble_outline, size: 17),
    label: const Text('Chat Grup', style: TextStyle(fontSize: 12)),
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue,
      side: const BorderSide(color: Color(0xFFBBD7FF)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
    ),
  );
}

class _TenantAvatarStack extends StatelessWidget {
  final int count;

  const _TenantAvatarStack({required this.count});

  static const _avatarColors = [
    Color(0xFF4C7897),
    Color(0xFFB47A59),
    Color(0xFF7189B7),
    Color(0xFF527968),
    Color(0xFF8D6F91),
  ];

  @override
  Widget build(BuildContext context) {
    final visibleCount = count > 5 ? 5 : count;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < visibleCount; i++)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: _avatarColors[i % _avatarColors.length],
              child: const Icon(Icons.person, size: 16, color: Colors.white),
            ),
          ),
        if (count > visibleCount)
          CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFEAF1FC),
            child: Text(
              '+${count - visibleCount}',
              style: const TextStyle(fontSize: 9, color: Color(0xFF54709F)),
            ),
          ),
      ],
    );
  }
}

class _GroupChatCard extends StatelessWidget {
  const _GroupChatCard();

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: const Color(0xFFF0F6FF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(color: Color(0xFFDCEAFF)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundColor: Color(0xFFDDEBFF),
            child: Icon(Icons.forum_rounded, color: Colors.blue, size: 27),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chat Grup Semua Kos',
                  style: TextStyle(
                    color: Color(0xFF123A83),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Pantau informasi dan komunikasi penghuni dalam satu tempat.',
                  style: TextStyle(color: Color(0xFF7187B2), fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            tooltip: 'Lihat semua grup',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Fitur chat grup belum tersedia.')),
            ),
            icon: const Icon(Icons.chevron_right, color: Colors.blue),
          ),
        ],
      ),
    ),
  );
}

class _KosItem {
  final String name;
  final String address;
  final int rooms;
  final int tenants;
  final bool active;
  final List<Color> colors;

  const _KosItem({
    required this.name,
    required this.address,
    required this.rooms,
    required this.tenants,
    required this.colors,
    this.active = true,
  });
}
