import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_layanan.dart';
import '../models/pengajuan_model.dart';

class HalamanRincian extends StatefulWidget {
  const HalamanRincian({super.key, required this.layanan});

  final Layanan layanan;

  @override
  State<HalamanRincian> createState() => _HalamanRincianState();
}

class _HalamanRincianState extends State<HalamanRincian> {
  bool _sedangMengirim = false;

  Future<void> _ajukan() async {
    setState(() {
      _sedangMengirim = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.read<PengajuanModel>().ajukan(widget.layanan.nama);
    setState(() {
      _sedangMengirim = false;
    });
    Navigator.pop(
      context,
      'Permohonan ${widget.layanan.nama} berhasil diajukan',
    );
  }

  @override
  Widget build(BuildContext context) {
    final layanan = widget.layanan;
    final sudah = context.select<PengajuanModel, bool>(
      (m) => m.sudahDiajukan(layanan.nama),
    );

    return Scaffold(
      appBar: AppBar(title: Text(layanan.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(layanan.ikon, size: 64),
            const SizedBox(height: 16),
            Text(layanan.nama, style: Theme.of(context).textTheme.headlineSmall),
            Text('Bidang ${layanan.bidang}'),
            const SizedBox(height: 16),
            Text(layanan.deskripsi),
            const Spacer(),
            FilledButton.icon(
              onPressed: (_sedangMengirim || sudah) ? null : _ajukan,
              icon: _sedangMengirim
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              label: Text(
                _sedangMengirim
                    ? 'Mengirim...'
                    : sudah
                        ? 'Sudah Diajukan'
                        : 'Ajukan Permohonan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
