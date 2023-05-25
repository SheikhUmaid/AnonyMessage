import 'package:anonymessage/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/dialog_box.dart';
import '../network/api_services.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isRegistering = false.obs;
  Register() async {
    isRegistering.value = true;
    Map data = {
      "username": usernameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "first_name": nameController.value.text
    };
    var response = await ApiServices().postAPI(
        url: 'https://anonymessage.sheikhumaid.repl.co/register/',
        body: data,
        header1: {});

    isRegistering.value = false;
    debugPrint(response.statusCode.toString());
    if (response != null) {
      if (response.statusCode == 201) {
        Get.snackbar("Body", response.body.toString());
        Get.dialog(
          DialogBox(
              text: 'Now you can login',
              titleText: 'Success',
              icon: (Icons.done),
              iconColor: Colors.green,
              onTap: () {
                Get.to(LoginScreen());
              }),
        );
      } else {
        Get.snackbar("Error", response.body.toString());
        Get.dialog(
          DialogBox(
            text: response.body.toString(),
            titleText: 'Error',
            iconColor: Colors.red,
            icon: (Icons.close),
            onTap: () {
              Get.back();
            },
          ),
        );
      }
    } else {}
  }
}
