import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double marginTop;
  final double marginHor;
  final Color color;
  final VoidCallback onTap;

  AppButton(
      {super.key,
      this.text = "",
      this.marginTop = 20,
      this.marginHor = 14,
      this.color = AppColors.yellow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin:
            EdgeInsets.symmetric(horizontal: marginHor).copyWith(top: marginTop),
        height: 50,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "bold",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
