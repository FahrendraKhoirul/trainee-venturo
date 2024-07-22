class SignInModel {
  int? statusCode;
  Data? data;
  List<String>? errors;

  SignInModel({this.statusCode, this.data, this.errors});

  SignInModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? idUser;
  String? email;
  String? nama;
  int? mRolesId;
  int? isGoogle;
  Akses? akses;

  User(
      {this.idUser,
      this.email,
      this.nama,
      this.mRolesId,
      this.isGoogle,
      this.akses});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    email = json['email'];
    nama = json['nama'];
    mRolesId = json['m_roles_id'];
    isGoogle = json['is_google'];
    akses = json['akses'] != null ? Akses.fromJson(json['akses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['email'] = email;
    data['nama'] = nama;
    data['m_roles_id'] = mRolesId;
    data['is_google'] = isGoogle;
    if (akses != null) {
      data['akses'] = akses!.toJson();
    }
    return data;
  }
}

class Akses {
  bool? masterRoles;
  bool? masterUser;
  bool? masterAkses;
  bool? penggunaAkses;
  bool? penggunaUser;
  bool? appTransaksi1;
  bool? laporanLaporan1;

  Akses(
      {this.masterRoles,
      this.masterUser,
      this.masterAkses,
      this.penggunaAkses,
      this.penggunaUser,
      this.appTransaksi1,
      this.laporanLaporan1});

  Akses.fromJson(Map<String, dynamic> json) {
    masterRoles = json['master_roles'];
    masterUser = json['master_user'];
    masterAkses = json['master_akses'];
    penggunaAkses = json['pengguna_akses'];
    penggunaUser = json['pengguna_user'];
    appTransaksi1 = json['app_transaksi1'];
    laporanLaporan1 = json['laporan_laporan1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['master_roles'] = masterRoles;
    data['master_user'] = masterUser;
    data['master_akses'] = masterAkses;
    data['pengguna_akses'] = penggunaAkses;
    data['pengguna_user'] = penggunaUser;
    data['app_transaksi1'] = appTransaksi1;
    data['laporan_laporan1'] = laporanLaporan1;
    return data;
  }
}
