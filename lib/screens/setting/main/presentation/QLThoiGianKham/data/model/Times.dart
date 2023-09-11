class Times {
  String? timeStartAM;
  String? timeEndAM;
  String? timeStartPM;
  String? timeEndPM;
  String? time;
  String? amountPatient;
  String? note;
  int? state;
  bool? isApply;
  List<Hourlist>? hourlist;
  String? id;

  Times(
      {this.timeStartAM,
        this.timeEndAM,
        this.timeStartPM,
        this.timeEndPM,
        this.time,
        this.amountPatient,
        this.note,
        this.state,
        this.isApply,
        this.hourlist,
        this.id});

  Times.fromJson(Map<String, dynamic> json) {
    timeStartAM = json['timeStartAM'];
    timeEndAM = json['timeEndAM'];
    timeStartPM = json['timeStartPM'];
    timeEndPM = json['timeEndPM'];
    time = json['time'];
    amountPatient = json['amountPatient'];
    note = json['note'];
    state = json['state'];
    isApply = json['isApply'];
    if (json['hourlist'] != null) {
      hourlist = <Hourlist>[];
      json['hourlist'].forEach((v) {
        hourlist!.add(new Hourlist.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeStartAM'] = this.timeStartAM;
    data['timeEndAM'] = this.timeEndAM;
    data['timeStartPM'] = this.timeStartPM;
    data['timeEndPM'] = this.timeEndPM;
    data['time'] = this.time;
    data['amountPatient'] = this.amountPatient;
    data['note'] = this.note;
    data['state'] = this.state;
    data['isApply'] = this.isApply;
    if (this.hourlist != null) {
      data['hourlist'] = this.hourlist!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Hourlist {
  int? stt;
  String? time;
  bool? check;
  String? id;

  Hourlist({this.stt, this.time, this.check, this.id});

  Hourlist.fromJson(Map<String, dynamic> json) {
    stt = json['stt'];
    time = json['time'];
    check = json['check'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stt'] = this.stt;
    data['time'] = this.time;
    data['check'] = this.check;
    data['id'] = this.id;
    return data;
  }
}