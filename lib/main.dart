import 'package:anonymessage/pages/home_page.dart';
import 'package:anonymessage/pages/login_screen.dart';
import 'package:anonymessage/pages/register_screen.dart';
import 'package:anonymessage/pages/settings_screen.dart';
import 'package:anonymessage/pages/update_profile_screen.dart';
import 'package:anonymessage/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user_info.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('userBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      // showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Hive.box('tokenBox').get('tokenKey') != null
          ? HomePage()
          : LoginScreen(),
      routes: {
        AppRoutes.HOME: (_) => HomePage(),
        AppRoutes.LOGIN: (_) => LoginScreen(),
        AppRoutes.REGISTER: (_) => RegisterScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(),
        AppRoutes.UPDATE_PROFILE: (_) => UpdateProfileScreen(),
      },
    );
  }
}
