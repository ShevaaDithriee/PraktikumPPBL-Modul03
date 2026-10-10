import 'package:flutter/material.dart';

class Layanan {
  const Layanan({
    required this.nama,
    required this.bidang,
    required this.deskripsi,
    required this.ikon,
  });

  final String nama;
  final String bidang;
  final String deskripsi;
  final IconData ikon;
}

const daftarBidang = ['Perizinan', 'Kesehatan', 'Transportasi'];

const daftarLayanan = [
  Layanan(nama: 'Izin Mendirikan Bangunan', bidang: 'Perizinan', ikon: Icons.apartment,
      deskripsi: 'Pengajuan izin untuk mendirikan atau mengubah bangunan di wilayah kota.'),
  Layanan(nama: 'Izin Usaha Mikro', bidang: 'Perizinan', ikon: Icons.storefront,
      deskripsi: 'Pendaftaran izin usaha bagi pelaku usaha mikro dan kecil.'),
  Layanan(nama: 'Pendaftaran Puskesmas', bidang: 'Kesehatan', ikon: Icons.local_hospital,
      deskripsi: 'Pendaftaran antrean berobat di puskesmas terdekat.'),
  Layanan(nama: 'Jadwal Imunisasi', bidang: 'Kesehatan', ikon: Icons.vaccines,
      deskripsi: 'Informasi dan pendaftaran jadwal imunisasi anak dan dewasa.'),
  Layanan(nama: 'Kartu Bus Kota', bidang: 'Transportasi', ikon: Icons.directions_bus,
      deskripsi: 'Pembuatan kartu langganan angkutan umum kota.'),
  Layanan(nama: 'Izin Trayek Angkot', bidang: 'Transportasi', ikon: Icons.alt_route,
      deskripsi: 'Pengajuan izin trayek untuk angkutan kota.'),
];
