class PlacePridiction {
  String secondary_text;
  String main_text;
  String place_id;

  PlacePridiction({
    required this.secondary_text,
    required this.main_text,
    required this.place_id,
  });

  factory PlacePridiction.fromJson(Map<String, dynamic> json) =>
      PlacePridiction(
        secondary_text: json["structured_formatting"]["secondary_text"],
        main_text: json["structured_formatting"]["main_text"],
        place_id: json["place_id"],
      );
}
