import 'package:flutter/material.dart';

class Pemasaran extends StatelessWidget {
  const Pemasaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pemasaran'),
            Text(
              'Jangkau lebih banyak calon penghuni',
              style: TextStyle(fontSize: 12),
              )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsetsGeometry.all(16),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'performa promosi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                    )
                ],
              )
            ),
          )
        ],
      ) ,
    );
  }
}