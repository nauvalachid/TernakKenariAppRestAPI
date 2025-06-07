import 'dart:convert';

class BuyerProfileRequestModel {
    final int? burungId;
    final String? burungType;
    final int? harga;
    final String? deskripsi;

    BuyerProfileRequestModel({
        this.burungId,
        this.burungType,
        this.harga,
        this.deskripsi,
    });

    factory BuyerProfileRequestModel.fromJson(String str) => BuyerProfileRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BuyerProfileRequestModel.fromMap(Map<String, dynamic> json) => BuyerProfileRequestModel(
        burungId: json["burung_id"],
        burungType: json["burung_type"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toMap() => {
        "burung_id": burungId,
        "burung_type": burungType,
        "harga": harga,
        "deskripsi": deskripsi,
    };
}
