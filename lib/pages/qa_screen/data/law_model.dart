import 'package:petition_ha/pages/qa_screen/data/section_model.dart';

class ListLawsModel {
  List<Data>? data;

  ListLawsModel({this.data});

  ListLawsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? law;
  Chapter? chapter;
  DateTime? createDate;
  DateTime? lastUpdate;

  Data(
      {this.id,
      this.title,
      this.law,
      this.chapter,
      this.createDate,
      this.lastUpdate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    law = json['law'];
    chapter =
        json['chapter'] != null ? Chapter.fromJson(json['chapter']) : null;
    createDate = DateTime.parse(json['createDate']);
    lastUpdate = DateTime.parse(json['lastUpdate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['law'] = law;
    if (chapter != null) {
      data['chapter'] = chapter!.toJson();
    }
    data['createDate'] = createDate;
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}

class Chapter {
  int? id;
  String? name;
  Section? section;

  Chapter({this.id, this.name, this.section});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    section =
        json['section'] != null ? Section.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (section != null) {
      data['section'] = section!.toJson();
    }
    return data;
  }
}

class Section {
  int? id;
  String? name;
  Category? category;

  Section({this.id, this.name, this.category});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
