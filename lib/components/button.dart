import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onTap});
  Widget text;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Center(child: text),
      ),
    );
  }
}

class EditProfileButton extends StatefulWidget {
  EditProfileButton({super.key, required this.text, required this.onTap});
  String text;
  void Function()? onTap;

  @override
  State<EditProfileButton> createState() => _EditProfileButtonState();
}

class _EditProfileButtonState extends State<EditProfileButton> {
  Color black = Colors.black;

  Color white = Colors.white;

  Color themeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) {
          setState(() {
            themeColor = black;
          });
        },
        onTapUp: (_) {
          setState(() {
            themeColor = white;
          });
        },
        onTapCancel: () {
          setState(() {
            themeColor = white;
          });
        },
        child: Container(
          height: Get.height * .075,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: themeColor)),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 17.0, color: themeColor),
            ),
          ),
        ),
      ),
    );
  }
}
