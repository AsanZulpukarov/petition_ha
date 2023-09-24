class Creator {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? inn;
  String? role;
  double? rating;
  DateTime? createDate;
  DateTime? lastUpdate;

  Creator(
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

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    inn = json['inn'];
    role = json['role'];
    rating = json['rating'];
    createDate = DateTime.parse(json['createDate']);
    lastUpdate = DateTime.parse(json['lastUpdate']);
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
