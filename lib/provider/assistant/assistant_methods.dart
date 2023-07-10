import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/provider/assistant/request_assistant.dart';
import 'package:rider_app/provider/data_handler/app_data.dart';
import 'package:rider_app/provider/models/address.dart';
import 'package:rider_app/provider/utils/config_maps.dart';

import '../models/direct_details.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, BuildContext context) async {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String placeId = "";
    String formattedAddress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
      st1 = response["results"][0]["address_components"][1]["long_name"];
      st2 = response["results"][0]["address_components"][2]["long_name"];
      st3 = response["results"][0]["address_components"][3]["long_name"];
      st4 = response["results"][0]["address_components"][4]["long_name"];
      placeAddress = "$st1, $st2, $st3, $st4";
      placeId = response["results"][0]["place_id"];
      formattedAddress = response["results"][0]["formatted_address"];

      Address userPickUpAddress = Address(
          placeFormattedAddress: formattedAddress,
          placeName: placeAddress,
          plaseId: placeId,
          latitude: position.latitude,
          longitude: position.longitude);

      // ignore: use_build_context_synchronously
      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }

  static Future<DiractionDetails?> obtainPlaceDirectionDetails(
      LatLng initiaPosition, LatLng finalPosition) async {
    var url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initiaPosition.latitude},${initiaPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapKey";

    var res = await RequestAssistant.getRequest(url);

    if (res == "failed") {
      return null;
    }

    DiractionDetails diractionDetails = DiractionDetails(
        distanceValue: res['routes'][0]['legs'][0]['distance']["value"],
        durationValue: res['routes'][0]['legs'][0]['duration']["value"],
        distanceText: res['routes'][0]['legs'][0]['distance']["text"],
        durationText: res['routes'][0]['legs'][0]['duration']["text"],
        encodedPoints: res['routes'][0]['overview_polyline']['points']);

    return diractionDetails;
  }
}
