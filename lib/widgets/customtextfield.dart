import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  CustomTextField({Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        filled: true,
        fillColor: Color(0xffdcdce8),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
