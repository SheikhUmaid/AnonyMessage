// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MessageTile extends StatelessWidget {
  MessageTile({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: Get.width * .7,
      height: 200,
      borderRadius: 20,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white38.withOpacity(0.2),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white24.withOpacity(0.2),
          Colors.white70.withOpacity(0.2),
        ],
      ),
      child: child,
    );
  }
}
