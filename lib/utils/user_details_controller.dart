import 'dart:convert';

import 'package:anonymessage/models/user_info.dart';
import 'package:anonymessage/network/api_services.dart';
import 'package:anonymessage/utils/final_variables.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDetailsControler extends GetxController {
  void saveDetails() async {
    try {
      final String apiUrl = '${FinalVariables().BASE_API_URL}/profile/';
      final String token = Hive.box('tokenBox').get('tokenKey').toString();

      final response = await ApiServices().getAPI(
        url: apiUrl,
        header1: {'Authorization': 'Token $token'},
      );

      final data = jsonDecode(response.body.toString());

      final UserModel user = UserModel(
        name: data['data']['name'],
        bio: data['data']['bio'],
        imgUrl: (data['data']['profile_image'] == null)
            ? null
            : '${FinalVariables().BASE_API_URL}${data['data']['profile_image']}',
        webSendUrl:
            '${FinalVariables().BASE_API_URL}${data['data']['web_send_url']}',
      );

      final box = Hive.box('userBox');
      await box.put('UserDetails', user);
    } catch (e) {
      // Handle or log the error
    }
  }
}


// 

 
// {"data":{"name":"Sheikh Umaid","bio":"i am a software Engineer","is_verified":true,"profile_image":"/media/profiles/demoprofile.jpg","web_send_url":"/websendmessage/admin/"}}


