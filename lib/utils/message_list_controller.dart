import 'dart:convert';

import 'package:anonymessage/models/anonymessage.dart';
import 'package:anonymessage/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MessageListController extends GetxController {
  var messageList = <AnonyMessageModel>[].obs;
  RxBool loading = false.obs;

  Future<void> getMessages({bool forceRefresh = false}) async {
    messageList.clear();
    debugPrint('getMessage');

    try {
      loading.value = true;
      var response = await ApiServices().getAPI(
          url: "https://anonymessage.sheikhumaid.repl.co/getmessages/",
          header1: {
            'Authorization':
                'Token ${Hive.box("tokenBox").get("tokenKey").toString()}'
          });
      print(response.body);
      var data = jsonDecode(response.body.toString());
      for (var message in data["anonymessages"]) {
        messageList.add(
          AnonyMessageModel(
            message: message['message'],
            dateTime: message['created_at'],
          ),
        );
      }
      loading.value = false;
      print(messageList);
    } catch (e) {
      throw Exception(['sss']);
    }
  }
}
