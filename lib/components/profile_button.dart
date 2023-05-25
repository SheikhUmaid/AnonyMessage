// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  ProfileButton({super.key, required this.text, required this.onTap});
  String text;
  Function()? onTap;

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  Color borderColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          borderColor = Colors.black;
        });
      },
      onTapUp: (_) {
        setState(() {
          borderColor = Colors.white;
        });
      },
      onTapCancel: () {
        setState(() {
          borderColor = Colors.white;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(color: borderColor),
        )),
      ),
    );
  }
}
