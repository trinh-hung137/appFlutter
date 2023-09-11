class DuocVatTu {
  String? ma;
  String? ten;
  String? sdk;
  String? sqd;
  String? hcsdk;
  String? hamluong;
  String? hoatchat;
  String? duongdung;
  String? dvcapphat;
  String? donggoi;
  String? hangsx;
  String? nuocsx;
  bool? sudung;
  String? id;

  DuocVatTu(
      {this.ma,
        this.ten,
        this.sdk,
        this.sqd,
        this.hcsdk,
        this.hamluong,
        this.hoatchat,
        this.duongdung,
        this.dvcapphat,
        this.donggoi,
        this.hangsx,
        this.nuocsx,
        this.sudung,
        this.id});

  DuocVatTu.fromJson(Map<String, dynamic> json) {
    ma = json['ma'];
    ten = json['ten'];
    sdk = json['sdk'];
    sqd = json['sqd'];
    hcsdk = json['hcsdk'];
    hamluong = json['hamluong'];
    hoatchat = json['hoatchat'];
    duongdung = json['duongdung'];
    dvcapphat = json['dvcapphat'];
    donggoi = json['donggoi'];
    hangsx = json['hangsx'];
    nuocsx = json['nuocsx'];
    sudung = json['sudung'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ma'] = this.ma;
    data['ten'] = this.ten;
    data['sdk'] = this.sdk;
    data['sqd'] = this.sqd;
    data['hcsdk'] = this.hcsdk;
    data['hamluong'] = this.hamluong;
    data['hoatchat'] = this.hoatchat;
    data['duongdung'] = this.duongdung;
    data['dvcapphat'] = this.dvcapphat;
    data['donggoi'] = this.donggoi;
    data['hangsx'] = this.hangsx;
    data['nuocsx'] = this.nuocsx;
    data['sudung'] = this.sudung;
    data['id'] = this.id;
    return data;
  }
}
