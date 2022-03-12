import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logintask/helper/network.dart';
import 'package:logintask/model/login_model.dart';

class LoginRepo {
  static Future<Response> loginApi(
      {required BuildContext context, required UserModel loginModel}) async {
    Dio dio = Dio();
    var data = jsonEncode(loginModel);
    return await dio.post("${NetworkHelper.baseUrl}login", data: data,  options: Options(
      headers: {
        "Accept":"application/json",

      }, followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },


    ));
  }
}
