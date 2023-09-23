import 'package:petition_ha/model/user_model.dart';

class PetitionModel {
  int? id;
  UserModel? creator;
  String? ruTitle;
  String? kgTitle;
  String? ruDescription;
  String? kgDescription;
  String? photo;
  bool? isFollow;

  PetitionModel(
      {this.id,
      this.creator,
      this.ruTitle,
      this.kgTitle,
      this.ruDescription,
      this.kgDescription,
      this.photo,
      this.isFollow});

  PetitionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creator =
        json['creator'] != null ? UserModel.fromJson(json['creator']) : null;
    ruTitle = json['ruTitle'];
    kgTitle = json['kgTitle'];
    ruDescription = json['ruDescription'];
    kgDescription = json['kgDescription'];
    photo = json['photo'];
    isFollow = json['isFollow'];
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
    data['isFollow'] = isFollow;
    return data;
  }
}
