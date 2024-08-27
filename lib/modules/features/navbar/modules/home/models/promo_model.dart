class AllPromoAPIModel {
  int? statusCode;
  List<PromoModel>? dataPromos;
  List<String>? errors;

  AllPromoAPIModel({
    required this.statusCode,
    required this.dataPromos,
    required this.errors,
  });

  factory AllPromoAPIModel.fromJson(Map<String, dynamic> json) {
    // print("Parsing PromosModel from JSON: $json");
    return AllPromoAPIModel(
      statusCode: json["status_code"] ?? 0,
      dataPromos: json["data"] != null
          ? List<PromoModel>.from(
              json["data"].map((x) => PromoModel.fromJson(x)))
          : [],
      errors: json["errors"] != null
          ? List<String>.from(json["errors"].map((x) => x))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": List<dynamic>.from(dataPromos!.map((x) => x.toJson())),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };
}

class PromoModel {
  int? idPromo;
  String? nama;
  String? type;
  int? diskon;
  int? nominal;
  int? kadaluarsa;
  String? syaratKetentuan;
  String? foto;
  int? createdAt;
  int? createdBy;
  int? isDeleted;

  PromoModel({
    required this.idPromo,
    required this.nama,
    required this.type,
    required this.diskon,
    required this.nominal,
    required this.kadaluarsa,
    required this.syaratKetentuan,
    required this.foto,
    required this.createdAt,
    required this.createdBy,
    required this.isDeleted,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      idPromo: json["id_promo"] ?? 0,
      nama: json["nama"] ?? '',
      type: json["type"] ?? '',
      diskon: json["diskon"] ?? 0,
      nominal: json["nominal"] ?? 0,
      kadaluarsa: json["kadaluarsa"] ?? 0,
      syaratKetentuan: json["syarat_ketentuan"] ?? '',
      foto: json["foto"] ?? '',
      createdAt: json["created_at"] ?? 0,
      createdBy: json["created_by"] ?? 0,
      isDeleted: json["is_deleted"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_promo": idPromo,
        "nama": nama,
        "type": type,
        "diskon": diskon,
        "nominal": nominal,
        "kadaluarsa": kadaluarsa,
        "syarat_ketentuan": syaratKetentuan,
        "foto": foto,
        "created_at": createdAt,
        "created_by": createdBy,
        "is_deleted": isDeleted,
      };
}
