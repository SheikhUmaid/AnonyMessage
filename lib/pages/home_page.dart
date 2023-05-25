// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:anonymessage/pages/home_screen.dart';
import 'package:anonymessage/pages/profile_screen.dart';
import 'package:anonymessage/pages/search_screen.dart';
import 'package:anonymessage/utils/navigation_bar_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Widget> pages = [
    const SearchScreen(),
    const HomeScreen(),
    ProfileScreen(),
  ];
  NavBarController navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // toolbarHeight: Get.height * .06,
        toolbarHeight: MediaQuery.of(context).size.height * 0.055,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(.5),
        backgroundColor: Colors.white.withOpacity(.2),
        title: const Text('AnonyMessage'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return pages[navBarController.index.value];
      }),
      bottomNavigationBar: CurvedNavigationBar(
        // height: Get.height * 0.06,
        height: MediaQuery.of(context).size.height * 0.055,
        index: 1,
        backgroundColor: Colors.transparent,
        color: Colors.grey.withOpacity(.8),
        animationDuration: const Duration(milliseconds: 100),
        items: const [
          Icon(Icons.search),
          Icon(Icons.home),
          Icon(Icons.contacts),
        ],
        onTap: (index) {
          navBarController.indexSetter(index);
        },
      ),
    );
  }
}
