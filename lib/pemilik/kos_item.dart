import 'package:flutter/material.dart';

class KosItem {
  final String id;
  final String name;
  final String address;
  final int rooms;
  final bool active;
  final List<Color> colors;

  const KosItem({
    required this.id,
    required this.name,
    required this.address,
    required this.rooms,
    required this.colors,
    this.active = true,
  });
}
