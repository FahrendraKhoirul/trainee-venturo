class PromosModel {
  int? statusCode;
  List<DataPromo>? dataPromos;
  List<String>? errors;

  PromosModel({
    required this.statusCode,
    required this.dataPromos,
    required this.errors,
  });

  factory PromosModel.fromJson(Map<String, dynamic> json) {
    // print("Parsing PromosModel from JSON: $json");
    return PromosModel(
      statusCode: json["status_code"] ?? 0,
      dataPromos: json["data"] != null
          ? List<DataPromo>.from(json["data"].map((x) => DataPromo.fromJson(x)))
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

class DataPromo {
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

  DataPromo({
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

  factory DataPromo.fromJson(Map<String, dynamic> json) {
    return DataPromo(
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
