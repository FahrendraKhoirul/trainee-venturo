// ignore_for_file: constant_identifier_names

class MenusModel {
  int? statusCode;
  List<DataMenu>? dataMenus;
  List<String>? errors;

  MenusModel({
    required this.statusCode,
    required this.dataMenus,
    required this.errors,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) {
    // print("Parsing MenusModel from JSON: $json");
    return MenusModel(
      statusCode: json["status_code"] ?? 0,
      dataMenus: json["data"] != null
          ? List<DataMenu>.from(json["data"].map((x) => DataMenu.fromJson(x)))
          : [],
      errors: json["errors"] != null
          ? List<String>.from(json["errors"].map((x) => x))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": List<dynamic>.from(dataMenus!.map((x) => x.toJson())),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };
}

class DataMenu {
  int? idMenu;
  String? nama;
  KategoriMenu? kategori;
  int? harga;
  String? deskripsi;
  String? foto;
  int? status;

  DataMenu({
    required this.idMenu,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
    required this.foto,
    required this.status,
  });

  factory DataMenu.fromJson(Map<String, dynamic> json) {
    // print("Parsing DataMenu from JSON: $json");
    return DataMenu(
      idMenu: json["id_menu"] ?? 0,
      nama: json["nama"] ?? '',
      kategori: kategoriValues.map[json["kategori"]] ?? KategoriMenu.MAKANAN,
      harga: json["harga"] ?? 0,
      deskripsi: json["deskripsi"] ?? '',
      foto: json["foto"] ?? '',
      status: json["status"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_menu": idMenu,
        "nama": nama,
        "kategori": kategoriValues.reverse[kategori],
        "harga": harga,
        "deskripsi": deskripsi,
        "foto": foto,
        "status": status,
      };
}

enum KategoriMenu { MAKANAN, MINUMAN, SNACK }

final kategoriValues = EnumValues({
  "makanan": KategoriMenu.MAKANAN,
  "minuman": KategoriMenu.MINUMAN,
  "snack": KategoriMenu.SNACK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
