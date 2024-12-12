import 'dart:convert';

class CitizenShipList {
  String? citizenShip;
  String? citizenShipCode;
  String? languageCode;

  CitizenShipList({
    this.citizenShip,
    this.citizenShipCode,
    this.languageCode,
  });

  factory CitizenShipList.fromRawJson(String str) =>
      CitizenShipList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitizenShipList.fromJson(Map<String, dynamic> json) =>
      CitizenShipList(
        citizenShip: json["CitizenShip"],
        citizenShipCode: json["CitizenShipCode"],
        languageCode: json["LanguageCode"],
      );

  Map<String, dynamic> toJson() => {
        "CitizenShip": citizenShip,
        "CitizenShipCode": citizenShipCode,
        "LanguageCode": languageCode,
      };
}
