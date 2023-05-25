import 'package:anonymessage/utils/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void logout() {
  Hive.box('tokenBox').delete('tokenKey');
  Hive.box('userBox').delete('UserDetails');
  Get.back();
  Get.toNamed(AppRoutes.LOGIN);
}
