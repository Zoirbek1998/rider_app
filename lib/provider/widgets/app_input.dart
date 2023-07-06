import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  String? hintText;
  double marginTop;
  double marginHor;
  TextInputType textInputType;
  bool obscureText;
  TextEditingController? controller;

  AppInput({
    super.key,
    this.hintText,
    this.marginTop = 20,
    this.marginHor = 14,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin:  EdgeInsets.symmetric(
        horizontal: marginHor,
      ).copyWith(top: marginTop),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
