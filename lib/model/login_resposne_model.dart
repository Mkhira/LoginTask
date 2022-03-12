

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.token,
  });

  String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
