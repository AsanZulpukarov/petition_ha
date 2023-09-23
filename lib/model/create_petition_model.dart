class CreatePetitionModel {
  String? ruTitle;
  String? kgTitle;
  String? ruDescription;
  String? kgDescription;

  CreatePetitionModel(
      {this.ruTitle,
      this.kgTitle,
      this.ruDescription,
      this.kgDescription});

  CreatePetitionModel.fromJson(Map<String, dynamic> json) {
    ruTitle = json['ruTitle'];
    kgTitle = json['kgTitle'];
    ruDescription = json['ruDescription'];
    kgDescription = json['kgDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ruTitle'] = ruTitle;
    data['kgTitle'] = kgTitle;
    data['ruDescription'] = ruDescription;
    data['kgDescription'] = kgDescription;
    return data;
  }
}
