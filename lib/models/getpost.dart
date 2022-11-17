import 'dart:convert';

class BatikSevices {
  BatikSevices({
    this.status,
    required this.data,
  });

  String? status;
  List<Datum> data;

  factory BatikSevices.fromRawJson(String str) =>
      BatikSevices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BatikSevices.fromJson(Map<String, dynamic> json) => BatikSevices(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
