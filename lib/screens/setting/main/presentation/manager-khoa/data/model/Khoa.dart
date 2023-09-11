class Department {
  String? idDep;
  String? idDepYbt;
  String? name;
  String? type;
  String? specialty;
  String? idAddress;
  bool? ck1;
  bool? ck2;
  bool? ck3;
  bool? ck4;
  String? managerDep;
  String? levelBh;
  String? csyt;
  String? note;
  String? state;
  String? id;

  Department(this.idDep, this.idDepYbt, this.name, this.type, this.specialty, this.idAddress, this.ck1, this.ck2, this.ck3, this.ck4, this.managerDep, this.levelBh, this.csyt, this.note, this.state, this.id);

  Department.fromJson(Map<String, dynamic> json) {
    idDep = json["id_dep"];
    idDepYbt = json["id_dep_ybt"];
    name = json["name"];
    type = json["type"];
    specialty = json["specialty"];
    idAddress = json["id_address"];
    ck1 = json["ck1"];
    ck2 = json["ck2"];
    ck3 = json["ck3"];
    ck4 = json["ck4"];
    managerDep = json["manager_dep"];
    levelBh = json["levelBH"];
    csyt = json["csyt"];
    note = json["note"];
    state = json["state"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id_dep"] = idDep;
    _data["id_dep_ybt"] = idDepYbt;
    _data["name"] = name;
    _data["type"] = type;
    _data["specialty"] = specialty;
    _data["id_address"] = idAddress;
    _data["ck1"] = ck1;
    _data["ck2"] = ck2;
    _data["ck3"] = ck3;
    _data["ck4"] = ck4;
    _data["manager_dep"] = managerDep;
    _data["levelBH"] = levelBh;
    _data["csyt"] = csyt;
    _data["note"] = note;
    _data["state"] = state;
    _data["id"] = id;
    return _data;
  }
}