import 'package:flutter/material.dart';

import '../kos_item.dart';

class KosCard extends StatelessWidget {
  final KosItem kos;
  final int tenantCount;
  final VoidCallback? onViewTenants;

  const KosCard({super.key, required this.kos, required this.tenantCount, required this.onViewTenants});

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
                Expanded(child: _KosInformation(kos: kos, tenantCount: tenantCount)),
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
                  Row(children: [Expanded(child: information), const SizedBox(width: 8), _ChatButton(active: kos.active)])
                else ...[
                  information,
                  const SizedBox(height: 8),
                  Align(alignment: Alignment.centerRight, child: _ChatButton(active: kos.active)),
                ],
                const SizedBox(height: 10),
                const Divider(height: 1, color: Color(0xFFE4ECF8)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _TenantAvatarStack(count: tenantCount),
                    const Spacer(),
                    TextButton(
                      onPressed: onViewTenants,
                      style: TextButton.styleFrom(foregroundColor: const Color(0xFF0878F9), padding: const EdgeInsets.symmetric(horizontal: 4)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Text('Lihat Semua Penghuni'), SizedBox(width: 4), Icon(Icons.chevron_right, size: 21)],
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
  final KosItem kos;
  final int tenantCount;

  const _KosInformation({required this.kos, required this.tenantCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Text(kos.name, style: const TextStyle(color: Color(0xFF123A83), fontSize: 17, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: kos.active ? const Color(0xFFE1F7EC) : const Color(0xFFEBF0F8), borderRadius: BorderRadius.circular(20)),
              child: Text(kos.active ? 'Aktif' : 'Tidak Aktif', style: TextStyle(color: kos.active ? const Color(0xFF169B64) : const Color(0xFF7187B2), fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            const Icon(Icons.location_on, size: 17, color: Color(0xFF7187B2)),
            const SizedBox(width: 4),
            Expanded(child: Text(kos.address, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF7187B2), fontSize: 12))),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          children: [
            _InfoMetric(icon: Icons.calendar_month, text: '${kos.rooms} Kamar'),
            _InfoMetric(icon: Icons.groups_rounded, text: '$tenantCount Penghuni'),
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
      Text(text, style: const TextStyle(color: Color(0xFF7187B2), fontSize: 12)),
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
    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors), borderRadius: BorderRadius.circular(10)),
    child: const Icon(Icons.apartment_rounded, color: Colors.white, size: 42),
  );
}

class _ChatButton extends StatelessWidget {
  final bool active;

  const _ChatButton({required this.active});

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: active ? () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fitur chat grup belum tersedia.'))) : null,
    icon: const Icon(Icons.chat_bubble_outline, size: 17),
    label: const Text('Chat Grup', style: TextStyle(fontSize: 12)),
    style: OutlinedButton.styleFrom(foregroundColor: Colors.blue, side: const BorderSide(color: Color(0xFFBBD7FF)), padding: const EdgeInsets.symmetric(horizontal: 12)),
  );
}

class _TenantAvatarStack extends StatelessWidget {
  final int count;

  const _TenantAvatarStack({required this.count});

  static const _avatarColors = [
    Color(0xFF4C7897), Color(0xFFB47A59), Color(0xFF7189B7), Color(0xFF527968), Color(0xFF8D6F91),
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
            child: CircleAvatar(radius: 14, backgroundColor: _avatarColors[i % _avatarColors.length], child: const Icon(Icons.person, size: 16, color: Colors.white)),
          ),
        if (count > visibleCount)
          CircleAvatar(radius: 14, backgroundColor: const Color(0xFFEAF1FC), child: Text('+${count - visibleCount}', style: const TextStyle(fontSize: 9, color: Color(0xFF54709F))),),
      ],
    );
  }
}

