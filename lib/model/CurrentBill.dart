class CurrentBill {
  bool status;
  Bill bill;
  String photo;
  String message;

  CurrentBill({this.status, this.bill, this.photo, this.message});
  

  CurrentBill.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bill = json['bill'] != null ? new Bill.fromJson(json['bill']) : null;
    photo = json['photo'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.bill != null) {
      data['bill'] = this.bill.toJson();
    }
    data['photo'] = this.photo;
    data['message'] = this.message;
    return data;
  }
}

class Bill {
  String noSL;
  String nama;
  String tarif;
  String alamat;
  String meter;
  String cabang;
  String statusSL;
  int mLalu;
  int mSekarang;
  int totalPemakaian;
  int bulan;
  int tahun;
  String periode;
  String tglBayar;
  String lunas;
  int nominal;
  String ket;
  String tgl;
  String namaCatat;
  String posx;
  String posy;

  Bill(
      {this.noSL,
      this.nama,
      this.tarif,
      this.alamat,
      this.meter,
      this.cabang,
      this.statusSL,
      this.mLalu,
      this.mSekarang,
      this.totalPemakaian,
      this.bulan,
      this.tahun,
      this.periode,
      this.tglBayar,
      this.lunas,
      this.nominal,
      this.ket,
      this.tgl,
      this.namaCatat,
      this.posx,
      this.posy});

  Bill.fromJson(Map<String, dynamic> json) {
    noSL = json['No_SL'];
    nama = json['Nama'];
    tarif = json['tarif'];
    alamat = json['Alamat'];
    meter = json['meter'];
    cabang = json['cabang'];
    statusSL = json['StatusSL'];
    mLalu = json['MLalu'];
    mSekarang = json['MSekarang'];
    totalPemakaian = json['TotalPemakaian'];
    bulan = json['Bulan'];
    tahun = json['Tahun'];
    periode = json['Periode'];
    tglBayar = json['Tgl_Bayar'];
    lunas = json['Lunas'];
    nominal = json['Nominal'];
    ket = json['Ket'];
    tgl = json['Tgl'];
    namaCatat = json['nama_catat'];
    posx = json['posx'];
    posy = json['posy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['No_SL'] = this.noSL;
    data['Nama'] = this.nama;
    data['tarif'] = this.tarif;
    data['Alamat'] = this.alamat;
    data['meter'] = this.meter;
    data['cabang'] = this.cabang;
    data['StatusSL'] = this.statusSL;
    data['MLalu'] = this.mLalu;
    data['MSekarang'] = this.mSekarang;
    data['TotalPemakaian'] = this.totalPemakaian;
    data['Bulan'] = this.bulan;
    data['Tahun'] = this.tahun;
    data['Periode'] = this.periode;
    data['Tgl_Bayar'] = this.tglBayar;
    data['Lunas'] = this.lunas;
    data['Nominal'] = this.nominal;
    data['Ket'] = this.ket;
    data['Tgl'] = this.tgl;
    data['nama_catat'] = this.namaCatat;
    data['posx'] = this.posx;
    data['posy'] = this.posy;
    return data;
  }
}
