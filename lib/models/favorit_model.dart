import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _favorit = {};

  List<String> get daftar => List.unmodifiable(_favorit);

  bool apakahFavorit(String namaLayanan) => _favorit.contains(namaLayanan);

  void tandai(String namaLayanan) {
    if (_favorit.add(namaLayanan)) {
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    if (_favorit.remove(namaLayanan)) {
      notifyListeners();
    }
  }
}
