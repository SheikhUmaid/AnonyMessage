import 'dart:io';

import 'package:anonymessage/utils/final_variables.dart';
import 'package:anonymessage/utils/user_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  RxString imagePath = ''.obs;
  final nameController = TextEditingController().obs;
  final bioController = TextEditingController().obs;
  RxBool isSending = false.obs;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future<void> pickImageAndSend() async {
    if (true) {
      isSending.value = true;
      print(Hive.box("tokenBox").get("tokenKey").toString());
      final url = "${FinalVariables().BASE_API_URL}update-profile/";
      final request = http.MultipartRequest('PUT', Uri.parse(url));
      request.headers['Authorization'] =
          "Token ${Hive.box("tokenBox").get("tokenKey").toString()}";
      if (imagePath.value.isNotEmpty) {
        print("image selected");
        final imageFile = File(imagePath.value);
        request.files
            .add(await http.MultipartFile.fromPath('image', imageFile.path));
      }
      print("No image");
      request.fields['name'] = nameController.value.text;
      request.fields['bio'] = bioController.value.text;
      final response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully!');
        UserDetailsControler().saveDetails();
        isSending.value = false;
        Get.snackbar("Message", "Saved");
      } else {
        print('Error uploading image: ${response.reasonPhrase}');
        isSending.value = false;
      }
    }
  }
}
