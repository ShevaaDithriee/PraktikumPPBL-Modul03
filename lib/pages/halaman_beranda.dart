import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat datang di Nusantara Cerdas',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                const Text(
                  'Ajukan layanan perizinan, kesehatan, dan transportasi '
                  'dari satu aplikasi. Tandai layanan favorit agar mudah ditemukan.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
