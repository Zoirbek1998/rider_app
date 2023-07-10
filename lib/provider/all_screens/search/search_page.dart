import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/generated/assets.dart';
import 'package:rider_app/provider/assistant/request_assistant.dart';
import 'package:rider_app/provider/data_handler/app_data.dart';
import 'package:rider_app/provider/models/address.dart';
import 'package:rider_app/provider/models/place_pridictions.dart';
import 'package:rider_app/provider/utils/config_maps.dart';
import 'package:rider_app/provider/widgets/app_input.dart';
import 'package:rider_app/provider/widgets/progress_dialog.dart';

import '../main_screen/widgets/dvider.dart';
import '../main_screen/widgets/prediction_title.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search-page";

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final pickUpController = TextEditingController();
  final dropOffController = TextEditingController();
  List<PlacePridiction> placeList = [];

  @override
  Widget build(BuildContext context) {
    String placeId =
        Provider.of<AppData>(context).pickUpLocation?.placeName ?? "";
    pickUpController.text = placeId;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Drop Off"),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6,
                      spreadRadius: 0.5)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Icon(Icons.location_on_rounded),
                      ),
                      Expanded(
                          child: AppInput(
                        controller: pickUpController,
                        hintText: "PickUp Location",
                        marginHor: 10,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Icon(Icons.location_on_outlined),
                      ),
                      Expanded(
                          child: AppInput(
                        hintText: "Where to?",
                        marginHor: 10,
                        onChanged: (value) {
                          findPlace(value);
                        },
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          placeList.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      itemCount: placeList.length,
                      separatorBuilder: (_, index) => const DividerWidget(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              getPlaceAddressDetails(
                                  placeList[index].place_id, context);
                            },
                            child: PredictionTitle(place: placeList[index]));
                      },
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  void findPlace(String plaseName) async {
    if (plaseName.length > 1) {
      String autoCompletUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$plaseName&key=$mapKey&sessiontoken=1234567890&companents=country:uz";
      // "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$plaseName&types=geocode&key=$mapKey";

      var res = await RequestAssistant.getRequest(autoCompletUrl);

      if (res == "failed") {
        return;
      } else if (res["status"] == "OK") {
        var predictions = res["predictions"];

        var placesList = (predictions as List)
            .map((e) => PlacePridiction.fromJson(e))
            .toList();
        setState(() {
          placeList = placesList;
        });
      }
    }
  }

  void getPlaceAddressDetails(String place_id, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) =>
            const ProgressDialog(message: "Setting DropOff, Please wait..."));

    String placeDetailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$place_id&key=$mapKey";

    var res = await RequestAssistant.getRequest(placeDetailUrl);

    Navigator.of(context).pop();

    if (res == "failed") {
      return;
    }

    if (res['status'] == "OK") {
      var address = Address(
        placeFormattedAddress: "",
        placeName: res["result"]["name"],
        plaseId: place_id,
        latitude: res["result"]["geometry"]["location"]["lat"],
        longitude: res["result"]["geometry"]["location"]["lng"],
      );

      Provider.of<AppData>(context, listen: false)
          .updateDropOffLocationAddress(address);

      Navigator.pop(context,"obtainDirection");
    }
  }
}
