//import 'dart:io';
//import 'dart:convert';
//import 'dart:io';
import 'package:intl/intl.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Utils {
  static Future<String> getToken() async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('token') ?? "";
  }

  static Future<String> getUserid() async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('userId') ?? "";
  }

  static Future<bool> getIsAdmin() async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getBool('isAdmin') ?? false;
  }

  static Future<String> getEmailUser() async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('email') ?? '';
  }

  // static DateTime parseTime(dynamic date) {
  //   return (date as Timestamp).toDate();
  // }

  // static Future<List<DataBarCode>> readJsonFileDataBarCode() async {
  //   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //   String filePath = '${appDocumentsDirectory.path}/data.json';
  //   String jsonString = await rootBundle.loadString('lib/assets/data.json');
  //
  //   print("Data $filePath");
  //   List<dynamic> jsonData = jsonDecode(jsonString);
  //   List<DataBarCode> products = jsonData.map((item) => DataBarCode.fromJson(item)).toList();
  //   return products;
  // }

  // static String getIdRandomByMilliseconds() {
  //   return DateTime.now().millisecondsSinceEpoch.toString();
  // }

  static String getDateTimeHoursCurrent() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy – kk:mm').format(now);
    return formattedDate;
  }

}
