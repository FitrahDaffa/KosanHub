
class KosModel {
  final String nama;
  final String alamat;
  final String lokasi;
  final int harga;
  final String tipeKamar;
  final List<String> fasilitas;
  final int jumlahKamar;
  final int jumlahPenghuni;
  final double rating;
  final String status;
  final String gambar;

  const KosModel({
    required this.nama,
    required this.alamat,
    required this.lokasi,
    required this.harga,
    required this.tipeKamar,
    required this.fasilitas,
    required this.jumlahKamar,
    required this.jumlahPenghuni,
    required this.rating,
    required this.status,
    required this.gambar,
  });
}

const List<KosModel> daftarKos = [
  KosModel(
    nama: 'Kos Melati',
    alamat: 'Jl. Cempaka No. 10, Bandung',
    lokasi: 'Bandung',
    harga: 750000,
    tipeKamar: 'Putra',
    fasilitas: ['WiFi', 'AC', 'Dapur', 'Parkir'],
    jumlahKamar: 10,
    jumlahPenghuni: 3,
    rating: 4.8,
    status: 'Tersedia',
    gambar: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=600',
  ),
  KosModel(
    nama: 'Kos Harapan',
    alamat: 'Jl. Mawar No. 8, Bandung',
    lokasi: 'Bandung',
    harga: 700000,
    tipeKamar: 'Putri',
    fasilitas: ['WiFi', 'AC', 'Parkir', 'Laundry'],
    jumlahKamar: 7,
    jumlahPenghuni: 2,
    rating: 4.5,
    status: 'Tersedia',
    gambar: 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=600',
  ),
  KosModel(
    nama: 'Kos Sinar Baru',
    alamat: 'Jl. Anggrek No. 12, Bandung',
    lokasi: 'Bandung',
    harga: 650000,
    tipeKamar: 'Campur',
    fasilitas: ['WiFi', 'Dapur', 'Parkir'],
    jumlahKamar: 8,
    jumlahPenghuni: 5,
    rating: 4.3,
    status: 'Tersedia',
    gambar: 'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?w=600',
  ),
  KosModel(
    nama: 'Kos Cemara',
    alamat: 'Jl. Melati No. 5, Bandung',
    lokasi: 'Bandung',
    harga: 600000,
    tipeKamar: 'Putra',
    fasilitas: ['WiFi', 'AC', 'Dapur', 'Parkir'],
    jumlahKamar: 12,
    jumlahPenghuni: 4,
    rating: 4.7,
    status: 'Penuh',
    gambar: 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?w=600',
  ),
  KosModel(
    nama: 'Kos Anggrek',
    alamat: 'Jl. Kenanga No. 7, Bandung',
    lokasi: 'Bandung',
    harga: 550000,
    tipeKamar: 'Putri',
    fasilitas: ['WiFi', 'Parkir'],
    jumlahKamar: 6,
    jumlahPenghuni: 3,
    rating: 4.2,
    status: 'Tersedia',
    gambar: 'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?w=600',
  ),
  KosModel(
    nama: 'Kos Mawar',
    alamat: 'Jl. Sukabirus, Bandung',
    lokasi: 'Bandung',
    harga: 850000,
    tipeKamar: 'Campur',
    fasilitas: ['WiFi', 'AC', 'Laundry'],
    jumlahKamar: 9,
    jumlahPenghuni: 6,
    rating: 4.6,
    status: 'Tersedia',
    gambar: 'https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=600',
  ),
];

String formatRupiah(int harga) {
  final angka = harga.toString();
  final hasil = StringBuffer();

  for (int i = 0; i < angka.length; i++) {
    hasil.write(angka[i]);

    int sisa = angka.length - i - 1;

    if (sisa > 0 && sisa % 3 == 0) {
      hasil.write('.');
    }
  }

  return 'Rp ${hasil.toString()}';
}
