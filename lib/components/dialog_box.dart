// ignore_for_file: must_be_immutable

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  String text;
  String titleText;
  IconData icon;
  Color iconColor;
  Function()? onTap;
  DialogBox(
      {super.key,
      required this.text,
      required this.icon,
      required this.titleText,
      required this.iconColor,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            width: Get.width * .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 75,
                ),
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  child: Text(
                    titleText,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    child: Text(
                      text,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: Get.height * .05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const DefaultTextStyle(
                          style: TextStyle(), child: Text('Ok')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
