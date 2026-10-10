import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pengajuan_model.dart';

class BadgePengajuan extends StatelessWidget {
  const BadgePengajuan({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final total = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );
    return Badge(
      isLabelVisible: total > 0,
      label: Text('$total'),
      child: child,
    );
  }
}