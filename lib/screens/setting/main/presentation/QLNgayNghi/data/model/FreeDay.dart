class FreeDay {
  String? type;
  String? thu;
  String? fromDay;
  String? toDay;
  bool? freeMorning;
  bool? freeAfternoon;
  bool? freeRemote;
  bool? freeCSYT;
  String? id;

  FreeDay(
      {this.type,
        this.thu,
        this.fromDay,
        this.toDay,
        this.freeMorning,
        this.freeAfternoon,
        this.freeRemote,
        this.freeCSYT,
        this.id});

  FreeDay.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    thu = json['thu'];
    fromDay = json['fromDay'];
    toDay = json['toDay'];
    freeMorning = json['freeMorning'];
    freeAfternoon = json['freeAfternoon'];
    freeRemote = json['freeRemote'];
    freeCSYT = json['freeCSYT'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['thu'] = this.thu;
    data['fromDay'] = this.fromDay;
    data['toDay'] = this.toDay;
    data['freeMorning'] = this.freeMorning;
    data['freeAfternoon'] = this.freeAfternoon;
    data['freeRemote'] = this.freeRemote;
    data['freeCSYT'] = this.freeCSYT;
    data['id'] = this.id;
    return data;
  }
}
