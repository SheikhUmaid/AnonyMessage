import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsTile extends StatefulWidget {
  SettingsTile({super.key, required this.text, required this.onTap});
  String text;
  Function()? onTap;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          bgColor = Colors.grey;
        });
      },
      onTapUp: (_) {
        setState(() {
          bgColor = Colors.white;
        });
      },
      onTapCancel: () {
        setState(() {
          bgColor = Colors.white;
        });
      },
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
