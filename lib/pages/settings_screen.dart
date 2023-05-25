import 'package:anonymessage/components/settings_tile.dart';
import 'package:anonymessage/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../utils/logout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("Settings"),
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(.5),
      ),
      body: ListView(
        children: [
          SettingsTile(
            text: 'Edit Profile',
            onTap: () {
              Get.toNamed(AppRoutes.UPDATE_PROFILE);
            },
          ),
          SettingsTile(
            text: 'Logout',
            onTap: () {
              Navigator.pop(context);
              logout();
            },
          ),
          SettingsTile(
            text: 'About',
            onTap: () {
              debugPrint('Hello world');
            },
          ),
        ],
      ),
    );
  }
}
