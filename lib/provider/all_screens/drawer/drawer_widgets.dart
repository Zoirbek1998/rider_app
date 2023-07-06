import 'package:flutter/material.dart';

import 'drawer_header.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children:  [
          ///Driver Header
          DrawerHeares(),

          const SizedBox(height: 12),

          const ListTile(
            leading: Icon(Icons.history),
            title: Text(
              "History",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Visit Profile",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "About",
              style: TextStyle(fontSize: 16),
            ),
          ),

        ],
      ),
    );
  }
}