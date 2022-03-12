import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logintask/helper/network.dart';
import 'package:logintask/model/login_model.dart';

class RegisterRepo {
  static Future<Response> registerApi(
      {required BuildContext context, required UserModel userModel}) async {
    Dio dio = Dio();
    var data = jsonEncode(userModel);
    return await dio.post("${NetworkHelper.baseUrl}register", data: data,  options: Options(
      headers: {
        "Accept":"application/json",

      }, followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },


    ));
  }
}
