class ListCommentModel {
  List<Data>? data;

  ListCommentModel({this.data});

  ListCommentModel.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  User? user;
  int? commentId;
  int? likeCount;
  int? dislikeCount;
  bool? isMineLike;
  bool? isMine;

  Data(
      {this.comment,
      this.user,
      this.commentId,
      this.likeCount,
      this.dislikeCount,
      this.isMineLike,
      this.isMine});

  Data.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    commentId = json['commentId'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
    isMineLike = json['isMineLike'];
    isMine = json['isMine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['commentId'] = commentId;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    data['isMineLike'] = isMineLike;
    data['isMine'] = isMine;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? inn;
  String? role;
  String? rating;
  String? createDate;
  String? lastUpdate;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.phoneNumber,
      this.inn,
      this.role,
      this.rating,
      this.createDate,
      this.lastUpdate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    inn = json['inn'];
    role = json['role'];
    rating = json['rating'];
    createDate = json['createDate'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['inn'] = inn;
    data['role'] = role;
    data['rating'] = rating;
    data['createDate'] = createDate;
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}
