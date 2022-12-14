import 'dart:convert';

class getargu {
  final String? text1;
  final String? text2;

  getargu(this.text1, this.text2);
}

// To parse this JSON data, do
//
//     final batikSevices = batikSevicesFromJson(jsonString);

class BatikSevices {
  BatikSevices({
    required this.code,
    required this.status,
    required this.userList,
  });

  int code;
  String status;
  List<UserList> userList;

  factory BatikSevices.fromRawJson(String str) =>
      BatikSevices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BatikSevices.fromJson(Map<String, dynamic> json) => BatikSevices(
        code: json["code"],
        status: json["status"],
        userList: List<UserList>.from(
            json["user_list"].map((x) => UserList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "user_list": List<dynamic>.from(userList.map((x) => x.toJson())),
      };
}

class UserList {
  UserList({
    required this.idPengguna,
    required this.username,
    required this.noTelephone,
    required this.password,
    required this.namaLengkap,
    required this.email,
    required this.level,
  });

  String idPengguna;
  String username;
  String noTelephone;
  String password;
  String namaLengkap;
  String email;
  String level;

  factory UserList.fromRawJson(String str) =>
      UserList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        idPengguna: json["id_pengguna"],
        username: json["username"],
        noTelephone: json["no_telephone"],
        password: json["password"],
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id_pengguna": idPengguna,
        "username": username,
        "no_telephone": noTelephone,
        "password": password,
        "nama_lengkap": namaLengkap,
        "email": email,
        "level": level,
      };
}
