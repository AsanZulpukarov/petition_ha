class ListCategoryModel {
  List<Data>? data;

  ListCategoryModel({this.data});

  ListCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  DateTime? createDate;
  DateTime? lastUpdate;

  Data({this.id, this.name, this.createDate, this.lastUpdate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createDate = DateTime.parse(json['createDate']);
    lastUpdate = DateTime.parse(json['lastUpdate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createDate'] = this.createDate;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}
