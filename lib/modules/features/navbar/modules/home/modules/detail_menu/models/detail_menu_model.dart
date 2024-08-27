import 'package:trainee/modules/global_models/menu_model.dart';

class DetailMenuAPIModel {
  int? statusCode;
  DetailMenuDataModel? data;

  DetailMenuAPIModel({this.statusCode, this.data});

  DetailMenuAPIModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null
        ? DetailMenuDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DetailMenuDataModel {
  MenuModel? menu;
  List<ToppingMenuModel>? topping;
  List<LevelMenuModel>? level;

  DetailMenuDataModel({this.menu, this.topping, this.level});

  DetailMenuDataModel.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? MenuModel.fromJson(json['menu']) : null;
    if (json['topping'] != null) {
      topping = <ToppingMenuModel>[];
      json['topping'].forEach((v) {
        topping!.add(ToppingMenuModel.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = <LevelMenuModel>[];
      json['level'].forEach((v) {
        level!.add(LevelMenuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    if (topping != null) {
      data['topping'] = topping!.map((v) => v.toJson()).toList();
    }
    if (level != null) {
      data['level'] = level!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToppingMenuModel {
  int? idDetail;
  int? idMenu;
  String? keterangan;
  String? type;
  int? harga;

  ToppingMenuModel(
      {this.idDetail, this.idMenu, this.keterangan, this.type, this.harga});

  ToppingMenuModel.fromJson(Map<String, dynamic> json) {
    idDetail = json['id_detail'];
    idMenu = json['id_menu'];
    keterangan = json['keterangan'];
    type = json['type'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_detail'] = idDetail;
    data['id_menu'] = idMenu;
    data['keterangan'] = keterangan;
    data['type'] = type;
    data['harga'] = harga;
    return data;
  }
}

class LevelMenuModel {
  int? idDetail;
  int? idMenu;
  String? keterangan;
  String? type;
  int? harga;

  LevelMenuModel(
      {this.idDetail, this.idMenu, this.keterangan, this.type, this.harga});

  LevelMenuModel.fromJson(Map<String, dynamic> json) {
    idDetail = json['id_detail'];
    idMenu = json['id_menu'];
    keterangan = json['keterangan'];
    type = json['type'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_detail'] = idDetail;
    data['id_menu'] = idMenu;
    data['keterangan'] = keterangan;
    data['type'] = type;
    data['harga'] = harga;
    return data;
  }
}
