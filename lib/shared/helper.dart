// ignore_for_file: nullable_type_in_catch_clause, use_function_type_syntax_for_parameters, avoid_print, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/response_model.dart';
import 'const.dart';
import 'package:jiffy/jiffy.dart';

class Helper {
  Future<bool> getApi(
      String url,
      String a,
      callback(
    Map<String, dynamic> res,
  ),
      {String? token}) async {
    Map<String, dynamic> res;
    ResponseModel resModel;

    try {
      final http.Response response = await http.get(
        Uri.parse(baseUrl + a),
      );

      if (response.statusCode == 200) {
        resModel = ResponseModel(
          rc: 200,
          data: jsonDecode(response.body),
        );
        callback(resModel.toJson());
        return false;
      }
      resModel = ResponseModel(
        rc: 400,
        data: jsonDecode(response.body),
      );
      callback(resModel.toJson());
    } on SocketException {
      resModel = ResponseModel(
        rc: 900,
        data: resNoConnection,
      );
      callback(resModel.toJson());
    } on HttpException {
      resModel = ResponseModel(
        rc: 901,
        data: resCouldntFindData,
      );
      callback(resModel.toJson());
    } on FormatException {
      resModel = ResponseModel(
        rc: 400,
        data: resBadResponse,
      );
      callback(resModel.toJson());
    }
    return false;
  }

  showSnackBar(
    String? message,
    context,
  ) {
    dynamic snackBar = SnackBar(
      content: Text(message!),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
