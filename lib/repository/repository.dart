

import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/api/info_product_by_BC_response_model.dart';
class Repository {
  final _dio = Dio();

  Future<InfoProductByBCResponseModel?> getInfoProductByBC(String barCode) async {
    try {
      var url = "http://113.163.69.8:9594/Product/GetInfoProductByBC_V3?PBarData=$barCode";
      print("getInfoProductByBC code: $barCode");
      print("getInfoProductByBC url: $url");
      var response = await _dio.get(url);
      if (response.statusCode == 200) {
        return InfoProductByBCResponseModel.fromJson(response.data);
      }
      print("Message status ${response.statusMessage}");
    } catch(e) {
      print(e);
    }
    return null;
  }

}