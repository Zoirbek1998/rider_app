import 'package:flutter/material.dart';

class DviderWidget extends StatelessWidget {
  const DviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      color: Colors.grey,
      thickness: 1,
    );
  }
}
