import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class DrawerHeares extends StatelessWidget {
  const DrawerHeares({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesUserImage,
            height: 65,
            width: 65,
          ),
          const SizedBox(
            width: 16,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Name",
                style: TextStyle(fontSize: 16, fontFamily: "bold"),
              ),
              SizedBox(
                height: 6,
              ),
              Text("Visit Profile")
            ],
          )
        ],
      ),
    );
  }
}
