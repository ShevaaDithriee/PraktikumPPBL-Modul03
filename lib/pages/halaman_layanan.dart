import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_layanan.dart';
import '../models/favorit_model.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: daftarBidang.length,
      child: Column(
        children: [
          TabBar(tabs: [for (final b in daftarBidang) Tab(text: b)]),
          Expanded(
            child: TabBarView(
              children: [
                for (final b in daftarBidang) _DaftarBidang(bidang: b),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DaftarBidang extends StatelessWidget {
  const _DaftarBidang({required this.bidang});

  final String bidang;

  @override
  Widget build(BuildContext context) {
    final data = daftarLayanan.where((l) => l.bidang == bidang).toList();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, i) => _KartuLayanan(layanan: data[i]),
    );
  }
}

class _KartuLayanan extends StatelessWidget {
  const _KartuLayanan({required this.layanan});

  final Layanan layanan;

  Future<void> _buka(BuildContext context) async {
    final hasil = await Navigator.pushNamed<String>(
      context,
      '/rincian',
      arguments: layanan,
    );
    if (!context.mounted || hasil == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(hasil)));
  }

  @override
  Widget build(BuildContext context) {
    final favorit = context.watch<FavoritModel>().apakahFavorit(layanan.nama);

    return Card(
      child: ListTile(
        leading: Icon(layanan.ikon),
        title: Text(layanan.nama),
        subtitle: Text(layanan.bidang),
        onTap: () => _buka(context),
        trailing: IconButton(
          tooltip: favorit ? 'Batalkan favorit' : 'Tandai favorit',
          icon: Icon(
            favorit ? Icons.star : Icons.star_border,
            color: favorit ? Colors.amber[700] : null,
          ),
          onPressed: () {
            final model = context.read<FavoritModel>();
            if (favorit) {
              model.batalTandai(layanan.nama);
            } else {
              model.tandai(layanan.nama);
            }
          },
        ),
      ),
    );
  }
}
