import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? phone;
  String? email;
  String? nickName;
  dynamic avatar;

  User({
    this.id,
    this.phone,
    this.email,
    this.nickName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phone: json["phone"],
        email: json["email"],
        nickName: json["nickName"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "email": email,
        "nickName": nickName,
        "avatar": avatar,
      };
}
