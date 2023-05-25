import 'package:anonymessage/components/button.dart';
import 'package:anonymessage/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/profile_button.dart';
import '../utils/logout.dart';

class ProfileScreen extends StatelessWidget {
  var box = Hive.box('userBox');

  ProfileScreen({super.key});
  String title = 'Profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: (box.get('UserDetails').imgUrl == null)
                  ? const Placeholder()
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
                        box.get('UserDetails').imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            box.get('UserDetails').name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            box.get('UserDetails').bio,
                            style: const TextStyle(color: Colors.white30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text:
                                      "${box.get('UserDetails').webSendUrl}"));
                              Get.snackbar('Message', 'Copied to ClipBoard');
                            },
                            text: 'Copy my link',
                          ),
                          ProfileButton(
                            onTap: () {
                              Get.toNamed(AppRoutes.SETTINGS);
                            },
                            text: 'Settings',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
