import 'dart:convert';

class AnakRequestModel {
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final String? gambarAnak;
    final int? ayahId;
    final int? ibuId;

    AnakRequestModel({
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.gambarAnak,
        this.ayahId,
        this.ibuId,
    });

    factory AnakRequestModel.fromJson(String str) => AnakRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnakRequestModel.fromMap(Map<String, dynamic> json) => AnakRequestModel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        gambarAnak: json["gambar_anak"],
        ayahId: json["ayah_id"],
        ibuId: json["ibu_id"],
    );

    Map<String, dynamic> toMap() => {
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "gambar_anak": gambarAnak,
        "ayah_id": ayahId,
        "ibu_id": ibuId,
    };
}
