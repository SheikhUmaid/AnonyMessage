// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiServices {
  Future<dynamic> getAPI(
      {required String url,
      Map? body,
      required Map<String, String> header1}) async {
    Map<String, String> header2 = {
      'Content-Type': 'application/json',
    };
    Map<String, String> headers = {...header2, ...header1};
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      return response;
    } on SocketException {
      Get.snackbar("Oops!", "No internet");
      return null;
    }
  }

  Future<dynamic> postAPI(
      {required String url,
      Map? body,
      required Map<String, String> header1}) async {
    Map<String, String> header2 = {
      'Content-Type': 'application/json',
    };
    Map<String, String> headers = {...header2, ...header1};
    try {
      var response = await http.post(Uri.parse(url), body: body);
      return response;
    } on SocketException {
      Get.snackbar("Oops!", "No internet");
      return null;
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
