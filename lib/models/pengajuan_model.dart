import 'package:flutter/foundation.dart';

class PengajuanModel extends ChangeNotifier {
  final List<String> _daftar = [];

  List<String> get daftar => List.unmodifiable(_daftar);

  int get totalPengajuan => _daftar.length;

  bool sudahDiajukan(String namaLayanan) => _daftar.contains(namaLayanan);

  void ajukan(String namaLayanan) {
    if (_daftar.contains(namaLayanan)) return;
    _daftar.add(namaLayanan);
    notifyListeners();
  }

  void batalkan(String namaLayanan) {
    if (_daftar.remove(namaLayanan)) {
      notifyListeners();
    }
  }
}