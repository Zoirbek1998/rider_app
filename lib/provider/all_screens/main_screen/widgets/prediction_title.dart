import 'package:flutter/material.dart';

import '../../../models/place_pridictions.dart';

class PredictionTitle extends StatelessWidget {
  final PlacePridiction place;

  const PredictionTitle({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        place.main_text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        place.secondary_text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      leading: const Icon(Icons.location_history),
    );
  }
}