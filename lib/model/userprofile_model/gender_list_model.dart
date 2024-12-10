import 'dart:convert';

class GenderList {
  String? gender;
  String? genderCode;
  String? languageCode;

  GenderList({
    this.gender,
    this.genderCode,
    this.languageCode,
  });

  factory GenderList.fromRawJson(String str) =>
      GenderList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenderList.fromJson(Map<String, dynamic> json) => GenderList(
        gender: json["Gender"],
        genderCode: json["GenderCode"],
        languageCode: json["LanguageCode"],
      );

  Map<String, dynamic> toJson() => {
        "Gender": gender,
        "GenderCode": genderCode,
        "LanguageCode": languageCode,
      };
}
