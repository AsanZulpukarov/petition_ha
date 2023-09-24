class PetitionsModel {
  List<Data>? data;

  PetitionsModel({this.data});

  PetitionsModel.fromJson(Map<String, dynamic> json) {
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
  String? ruTitle;
  String? ruDescription;

  Data({this.id, this.ruTitle, this.ruDescription});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ruTitle = json['ruTitle'];
    ruDescription = json['ruDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ruTitle'] = this.ruTitle;
    data['ruDescription'] = this.ruDescription;
    return data;
  }
}
