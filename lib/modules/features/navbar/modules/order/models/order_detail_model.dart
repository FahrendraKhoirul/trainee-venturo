class OrderDetailAPIModel {
  int? statusCode;
  OrderDetailDataModel? data;

  OrderDetailAPIModel({this.statusCode, this.data});

  OrderDetailAPIModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? OrderDetailDataModel.fromJson(json['data']) : null;
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

class OrderDetailDataModel {
  OrderModel? order;
  List<OrderDetailDetailModel>? detail;

  OrderDetailDataModel({this.order, this.detail});

  OrderDetailDataModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? OrderModel.fromJson(json['order']) : null;
    if (json['detail'] != null) {
      detail = <OrderDetailDetailModel>[];
      json['detail'].forEach((v) {
        detail!.add(OrderDetailDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  int? idOrder;
  String? noStruk;
  String? nama;
  int? idVoucher;
  String? namaVoucher;
  int? diskon;
  int? potongan;
  int? totalBayar;
  String? tanggal;
  int? status;

  OrderModel(
      {this.idOrder,
      this.noStruk,
      this.nama,
      this.idVoucher,
      this.namaVoucher,
      this.diskon,
      this.potongan,
      this.totalBayar,
      this.tanggal,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    noStruk = json['no_struk'];
    nama = json['nama'];
    idVoucher = json['id_voucher'];
    namaVoucher = json['nama_voucher'];
    diskon = json['diskon'];
    potongan = json['potongan'];
    totalBayar = json['total_bayar'];
    tanggal = json['tanggal'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_order'] = idOrder;
    data['no_struk'] = noStruk;
    data['nama'] = nama;
    data['id_voucher'] = idVoucher;
    data['nama_voucher'] = namaVoucher;
    data['diskon'] = diskon;
    data['potongan'] = potongan;
    data['total_bayar'] = totalBayar;
    data['tanggal'] = tanggal;
    data['status'] = status;
    return data;
  }
}

class OrderDetailDetailModel {
  int? idMenu;
  String? kategori;
  String? topping;
  String? nama;
  String? foto;
  int? jumlah;
  String? harga;
  int? total;
  String? catatan;

  OrderDetailDetailModel(
      {this.idMenu,
      this.kategori,
      this.topping,
      this.nama,
      this.foto,
      this.jumlah,
      this.harga,
      this.total,
      this.catatan});

  OrderDetailDetailModel.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    kategori = json['kategori'];
    topping = json['topping'];
    nama = json['nama'];
    foto = json['foto'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    total = json['total'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_menu'] = idMenu;
    data['kategori'] = kategori;
    data['topping'] = topping;
    data['nama'] = nama;
    data['foto'] = foto;
    data['jumlah'] = jumlah;
    data['harga'] = harga;
    data['total'] = total;
    data['catatan'] = catatan;
    return data;
  }
}
