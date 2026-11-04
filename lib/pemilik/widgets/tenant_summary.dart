import 'package:flutter/material.dart';
import 'package:flutter_application_1/pemilik/data/kosan_data.dart';

class TenantSummary extends StatelessWidget {
  const TenantSummary();

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
                Expanded(
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
                        '${jumlahPenghuni()} Orang',
                        style: TextStyle(
                          color: Color(0xFF123A83),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'dari ${jumlahKos()} kos yang Anda kelola',
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
            final statuses = Row(
              children: [
                Expanded(
                  child: _StatusCard(
                    label: 'Tinggal',
                    count: '${jumlahPenghuniStatus('Aktif')}',
                    color: Color(0xFF16B878),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _StatusCard(
                    label: 'Cuti',
                    count: '${jumlahPenghuniStatus('Cuti')}',
                    color: Color(0xFFFFB51B),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _StatusCard(
                    label: 'Keluar',
                    count: '${jumlahPenghuniStatus('Keluar')}',
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
