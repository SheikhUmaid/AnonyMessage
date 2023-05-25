import 'package:anonymessage/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text("This part of app is not rady yet!"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.dialog(Center(child: CircularProgressIndicator()));
            // Future.delayed(Duration(seconds: 2), () {
            //   print('Async task completed');
            //   // Perform further actions after the delay
            //   Get.back();
            // });
            Get.toNamed(AppRoutes.SETTINGS);
          },
          child: Icon(Icons.settings)),
    );
  }
}
