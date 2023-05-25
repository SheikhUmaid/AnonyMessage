import 'package:flutter/material.dart';

Widget textFiled({
  required String hint,
  required TextEditingController textController,
  bool obsText = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: TextFormField(
      obscureText: obsText,
      controller: textController,
      decoration: InputDecoration(
        label: Text(hint),
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    ),
  );
}

class EditProfileTextField extends StatelessWidget {
  EditProfileTextField(
      {super.key, required this.editingController, required this.labelText});
  TextEditingController? editingController;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: editingController,
        style: const TextStyle(
          // Customize the text style
          fontSize: 16.0,
          color: Colors.white,
          // Add more properties as needed
        ),
        decoration: InputDecoration(
          // Customize the decoration
          labelText: labelText, // Hint text
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            // Add border
            borderRadius:
                BorderRadius.circular(8.0), // Customize the border radius
            borderSide: const BorderSide(
                color: Colors.white), // Customize the border color
          ),
          enabledBorder: OutlineInputBorder(
            // Add border when the field is enabled
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            // Add border when the field is focused
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
        ),
      ),
    );
  }
}
