import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_layanan.dart';
import '../models/favorit_model.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Warga Nusantara'),
            subtitle: Text('Profil warga terdaftar'),
          ),
        ),
        const SizedBox(height: 16),
        Text('Layanan Favorit', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Consumer<FavoritModel>(
          builder: (context, favorit, child) {
            final daftar = favorit.daftar;
            if (daftar.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Belum ada layanan favorit. '
                      'Tandai bintang pada tujuan Layanan.'),
                ),
              );
            }
            return Column(
              children: [
                for (final nama in daftar)
                  Card(
                    child: ListTile(
                      leading: Icon(
                        daftarLayanan.firstWhere((l) => l.nama == nama).ikon,
                      ),
                      title: Text(nama),
                      subtitle: Text(
                        daftarLayanan.firstWhere((l) => l.nama == nama).bidang,
                      ),
                      trailing: IconButton(
                        tooltip: 'Batalkan favorit',
                        icon: Icon(Icons.star, color: Colors.amber[700]),
                        onPressed: () => favorit.batalTandai(nama),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
