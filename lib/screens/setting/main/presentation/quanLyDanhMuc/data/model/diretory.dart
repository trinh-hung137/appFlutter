class Directory {
  List<String>? listItem;
  String? id;

  Directory({this.listItem, this.id});

  Directory.fromJson(Map<String, dynamic> json) {
    listItem = json['listItem'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listItem'] = this.listItem;
    data['id'] = this.id;
    return data;
  }
}