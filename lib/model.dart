class Fakultas {
  final String fakultas;
  final String deskripsi;
  final List<Prodi> prodi;

  Fakultas(
      {required this.fakultas, required this.deskripsi, required this.prodi});

  factory Fakultas.fromJson(Map<String, dynamic> json) {
    var prodiFromJson = json['prodi'] as List;
    List<Prodi> prodiList =
        prodiFromJson.map((i) => Prodi.fromJson(i)).toList();

    return Fakultas(
      fakultas: json['fakultas'],
      deskripsi: json['deskripsi'],
      prodi: prodiList,
    );
  }
}

class Dosen {
  final String name;
  final String jabatan;

  Dosen({required this.name, required this.jabatan});

  factory Dosen.fromJson(Map<String, dynamic> json) {
    return Dosen(
      name: json['name'] ?? '',
      jabatan: json['jabatan'] ?? '',
    );
  }
}

class Prestasi {
  final String name;
  final int tahun;
  final String event;

  Prestasi({required this.name, required this.tahun, required this.event});

  factory Prestasi.fromJson(Map<String, dynamic> json) {
    return Prestasi(
      name: json['nama'],
      tahun: json['tahun'],
      event: json['event'],
    );
  }
}

class Prodi {
  final String logo;
  final String name;
  final String visi;
  final String misi;
  final String website;
  final String email;
  final String akreditasi;
  final String kaprodi;
  final List<Dosen> dosen;
  final List<Prestasi> prestasi;

  Prodi(
      {required this.logo,
      required this.name,
      required this.visi,
      required this.misi,
      required this.website,
      required this.email,
      required this.akreditasi,
      required this.kaprodi,
      required this.dosen,
      required this.prestasi});

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      logo: json['logo'],
      name: json['name'],
      misi: json['misi'],
      visi: json['visi'],
      email: json['email'],
      website: json['website'],
      akreditasi: json['akreditasi'],
      kaprodi: json['kaprodi'],
      dosen: json['dosen'] != null
          ? (json['dosen'] as List).map((i) => Dosen.fromJson(i)).toList()
          : [],
      prestasi: json['prestasi'] != null
          ? (json['prestasi'] as List).map((i) => Prestasi.fromJson(i)).toList()
          : [],
    );
  }
}
