import 'package:petition_ha/model/user_model.dart';

class ListPetitionModel {
  List<Data>? data;

  ListPetitionModel({this.data});

  ListPetitionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Creator? creator;
  String? ruTitle;
  String? kgTitle;
  String? ruDescription;
  String? kgDescription;
  String? photo;
  bool? isLike;
  int? likeCount;
  int? disLikeCount;
  Data({
    this.id,
    this.creator,
    this.ruTitle,
    this.kgTitle,
    this.ruDescription,
    this.kgDescription,
    this.photo,
    this.isLike,
    this.likeCount,
    this.disLikeCount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    ruTitle = json['ruTitle'];
    kgTitle = json['kgTitle'];
    ruDescription = json['ruDescription'];
    kgDescription = json['kgDescription'];
    photo = json['photo'];
    isLike = json['isFollow'];
    likeCount = json['likeCount'] ?? 1;
    disLikeCount = json['disLikeCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    data['ruTitle'] = ruTitle;
    data['kgTitle'] = kgTitle;
    data['ruDescription'] = ruDescription;
    data['kgDescription'] = kgDescription;
    data['photo'] = photo;
    data['isLike'] = isLike;
    data['likeCount'] = likeCount;
    data['disLikeCount'] = disLikeCount;
    return data;
  }
}
