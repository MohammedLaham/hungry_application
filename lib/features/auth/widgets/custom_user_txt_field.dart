import 'package:flutter/material.dart';

class CustomUserTxtField extends StatelessWidget {

  const CustomUserTxtField({super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      cursorColor: Colors.grey,
      cursorHeight: 20,
      style: TextStyle(color: Colors.grey.shade800),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade800),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
