import 'dart:convert';

import 'package:anonymessage/network/api_services.dart';
import 'package:anonymessage/utils/routes.dart';
import 'package:anonymessage/utils/user_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/dialog_box.dart';

class LoginControler extends GetxController {
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loggingIn = false.obs;

  getToken() async {
    if (usernameController.value.text.isEmpty) {}
    loggingIn.value = true;

    var response = await ApiServices().postAPI(
        url: 'https://anonymessage.sheikhumaid.repl.co/api-token-auth/',
        body: {
          "username": usernameController.value.text.toString(),
          "password": passwordController.value.text.toString()
        },
        header1: {});
    loggingIn.value = false;
    if (response != null) {
      if (response.statusCode == 200) {
        debugPrint(response.body.runtimeType.toString());
        Map map = jsonDecode(response.body);
        if (map['token'] != null) {
          var box = Hive.box('tokenBox');
          box.put('tokenKey', map['token'].toString());
          UserDetailsControler().saveDetails();
          Get.toNamed(AppRoutes.HOME);
        } else {
          Get.snackbar('Token error', response.body.toString());
        }
      } else {
        Get.dialog(
          DialogBox(
            titleText: response.body.toString(),
            text: 'You have entered wrong username or password',
            icon: Icons.close_outlined,
            iconColor: Colors.red,
            onTap: () {
              Get.back();
            },
          ),
        );
      }
    }
  }
}
