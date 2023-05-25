import 'dart:io';

import 'package:anonymessage/components/button.dart';
import 'package:anonymessage/components/textfields.dart';
import 'package:anonymessage/utils/toast.dart';
import 'package:anonymessage/utils/update_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  var box = Hive.box('userBox');
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    updateProfileController.nameController.value.text =
        box.get('UserDetails').name;
    updateProfileController.bioController.value.text =
        box.get('UserDetails').bio;
    return WillPopScope(
      onWillPop: () async {
        updateProfileController.imagePath.value = '';
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Obx(
                () {
                  return ((updateProfileController
                              .imagePath.value.isNotEmpty) ||
                          (box.get('UserDetails').imgUrl == null))
                      ? ColorFiltered(
                          colorFilter: const ColorFilter.matrix([
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Image(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(
                                updateProfileController.imagePath.value
                                    .toString(),
                              ),
                            ),
                          ),
                        )
                      : ColorFiltered(
                          colorFilter: const ColorFilter.matrix([
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Image.network(
                            box.get('UserDetails').imgUrl.toString().isEmpty
                                ? "https://anonymessage.sheikhumaid.repl.co/media/profiles/IMG-20230507-WA0006.jpg"
                                : box.get('UserDetails').imgUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                },
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(.678),
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditProfileButton(
                    text: 'Upload new profile',
                    onTap: () {
                      updateProfileController.getImage();
                    },
                  ),
                  EditProfileTextField(
                    editingController:
                        updateProfileController.nameController.value,
                    labelText: 'Full Name',
                  ),
                  EditProfileTextField(
                    editingController:
                        updateProfileController.bioController.value,
                    labelText: 'Bio',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () {
                    return EditProfileButton(
                      text: updateProfileController.isSending.value
                          ? 'Saving...'
                          : "Save",
                      onTap: () {
                        updateProfileController.pickImageAndSend();
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
