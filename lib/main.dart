import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/data_layanan.dart';
import 'models/favorit_model.dart';
import 'models/pengajuan_model.dart';
import 'pages/halaman_beranda.dart';
import 'pages/halaman_layanan.dart';
import 'pages/halaman_rincian.dart';
import 'pages/halaman_tentang.dart';
import 'pages/halaman_warga.dart';
import 'widgets/badge_pengajuan.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritModel()),
        ChangeNotifierProvider(create: (context) => PengajuanModel()),
      ],
      child: const NusantaraCerdasApp(),
    ),
  );
}
class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara Cerdas Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const KerangkaUtama(),
        '/tentang': (context) => const HalamanTentang(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/rincian') {
          final layanan = settings.arguments as Layanan;
          return MaterialPageRoute<String>(
            settings: settings,
            builder: (context) => HalamanRincian(layanan: layanan),
          );
        }
        return null;
      },
    );
  }
}
class KerangkaUtama extends StatefulWidget {
  const KerangkaUtama({super.key});
  @override
  State<KerangkaUtama> createState() => _KerangkaUtamaState();
}
class _KerangkaUtamaState extends State<KerangkaUtama> {
  int _indeks = 0;
  static const _judul = ['Nusantara Cerdas', 'Layanan Publik', 'Warga'];
  static const _halaman = [HalamanBeranda(), HalamanLayanan(), HalamanWarga()];
  void _pilih(int nilai) {
    setState(() {
      _indeks = nilai;
    });
  }
  @override
  Widget build(BuildContext context) {
    final isi = IndexedStack(index: _indeks, children: _halaman);
    return LayoutBuilder(
      builder: (context, constraints) {
        final lebar = constraints.maxWidth >= 720;
        return Scaffold(
          appBar: AppBar(title: Text(_judul[_indeks])),
          drawer: NavigationDrawer(
            selectedIndex: _indeks,
            onDestinationSelected: (i) {
              Navigator.pop(context);
              if (i == 3) {
                Navigator.pushNamed(context, '/tentang');
              } else {
                _pilih(i);
              }
            },
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
                child: Text('Menu Nusantara Cerdas'),
              ),
              NavigationDrawerDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Beranda'),
              ),
              NavigationDrawerDestination(
                icon: Icon(Icons.miscellaneous_services_outlined),
                selectedIcon: Icon(Icons.miscellaneous_services),
                label: Text('Layanan'),
              ),
              NavigationDrawerDestination(
                icon: BadgePengajuan(child: Icon(Icons.people_outline)),
                selectedIcon: BadgePengajuan(child: Icon(Icons.people)),
                label: Text('Warga'),
              ),
              NavigationDrawerDestination(
                icon: Icon(Icons.info_outline),
                label: Text('Tentang'),
              ),
            ],
          ),
          body: lebar
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _indeks,
                      onDestinationSelected: _pilih,
                      labelType: NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home),
                          label: Text('Beranda'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.miscellaneous_services_outlined),
                          selectedIcon: Icon(Icons.miscellaneous_services),
                          label: Text('Layanan'),
                        ),
                        NavigationRailDestination(
                          icon: BadgePengajuan(child: Icon(Icons.people_outline)),
                          selectedIcon: BadgePengajuan(child: Icon(Icons.people)),
                          label: Text('Warga'),
                        ),
                      ],
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: isi),
                  ],
                )
              : isi,
          bottomNavigationBar: lebar
              ? null
              : NavigationBar(
                  selectedIndex: _indeks,
                  onDestinationSelected: _pilih,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Beranda',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: 'Layanan',
                    ),
                    NavigationDestination(
                      icon: BadgePengajuan(child: Icon(Icons.people_outline)),
                      selectedIcon: BadgePengajuan(child: Icon(Icons.people)),
                      label: 'Warga',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
