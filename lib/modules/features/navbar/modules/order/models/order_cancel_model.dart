class OrderCancelAPIModel {
  int? statusCode;
  OrderCancelDataModel? data;

  OrderCancelAPIModel({this.statusCode, this.data});

  OrderCancelAPIModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null
        ? OrderCancelDataModel.fromJson(json['data'])
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

class OrderCancelDataModel {
  int? idOrder;
  String? noStruk;
  int? idUser;
  String? tanggal;
  int? idVoucher;
  String? idDiskon;
  int? diskon;
  int? potongan;
  int? totalBayar;
  int? status;
  double? bayar;
  double? kembalian;
  int? isDeleted;
  int? createdAt;
  int? createdBy;

  OrderCancelDataModel(
      {this.idOrder,
      this.noStruk,
      this.idUser,
      this.tanggal,
      this.idVoucher,
      this.idDiskon,
      this.diskon,
      this.potongan,
      this.totalBayar,
      this.status,
      this.bayar,
      this.kembalian,
      this.isDeleted,
      this.createdAt,
      this.createdBy});

  OrderCancelDataModel.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    noStruk = json['no_struk'];
    idUser = json['id_user'];
    tanggal = json['tanggal'];
    idVoucher = json['id_voucher'];
    idDiskon = json['id_diskon'];
    diskon = json['diskon'];
    potongan = json['potongan'];
    totalBayar = json['total_bayar'];
    status = json['status'];
    bayar = json['bayar'];
    kembalian = json['kembalian'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_order'] = idOrder;
    data['no_struk'] = noStruk;
    data['id_user'] = idUser;
    data['tanggal'] = tanggal;
    data['id_voucher'] = idVoucher;
    data['id_diskon'] = idDiskon;
    data['diskon'] = diskon;
    data['potongan'] = potongan;
    data['total_bayar'] = totalBayar;
    data['status'] = status;
    data['bayar'] = bayar;
    data['kembalian'] = kembalian;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
